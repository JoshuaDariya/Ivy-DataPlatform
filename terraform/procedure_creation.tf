resource "snowflake_procedure" "load_data" {
  name     = "LOAD_DATA"
  database = var.landing
  schema   = "RAINTREE"
  language = "SQL"
  arguments {
    name = "Source_Table"
    type = "varchar"
  }
  arguments {
    name = "Destination_Table"
    type = "varchar"
  }
  comment             = "Copy data from staging table to source, will rollback on error."
  return_type         = "NUMBER(38,0)"
  execute_as          = "CALLER"
  return_behavior     = "IMMUTABLE"
  statement           = <<EOT
DECLARE
        count NUMBER(38, 2) DEFAULT 0.0;
    BEGIN
    BEGIN TRANSACTION;
    TRUNCATE TABLE identifier(:DESTINATION_TABLE);                                                                                                                           
    INSERT INTO identifier(:DESTINATION_TABLE) SELECT * FROM identifier(:SOURCE_TABLE); 
    COMMIT;
    
    count:= SQLROWCOUNT;

    BEGIN TRANSACTION;
    TRUNCATE TABLE identifier(:SOURCE_TABLE);                                                                                                            
    COMMIT;

    return count;
exception
    when other then
        raise;
        rollback;
END
EOT
}

resource "snowflake_procedure" "delete_row" {
  name     = "DELETE_ROW_BY_COLUMN_VALUES"
  database = var.landing
  schema   = "RAINTREE"
  language = "JAVASCRIPT"
  arguments {
    name = "TABLE_NAME"
    type = "varchar"
  }
  arguments {
    name = "COLUMN1_NAME"
    type = "varchar"
  }
  arguments {
    name = "VALUE1_TO_MATCH"
    type = "varchar"
  }
  arguments {
    name = "COLUMN2_NAME"
    type = "varchar"
  }
  arguments {
    name = "VALUE2_TO_MATCH"
    type = "varchar"
  }
  comment             = "Delete header row based on columns to match."
  return_type         = "varchar"
  execute_as          = "CALLER"
  return_behavior     = "IMMUTABLE"
  statement           = <<EOT
try {
    var sql_command = "DELETE FROM " + TABLE_NAME + " WHERE " + COLUMN1_NAME + " = ? AND " + COLUMN2_NAME + " = ?";
    var statement1 = snowflake.createStatement({sqlText: sql_command, binds: [VALUE1_TO_MATCH, VALUE2_TO_MATCH]});
    var result = statement1.execute();
    var rowCount = statement1.getRowCount();
    return rowCount + " row(s) deleted successfully.";
  } catch (err) {
    return "Error: " + err;
}
EOT
}

resource "snowflake_procedure" "dbttests_alerts" {
  name     = "CHECK_DBT_TESTS_DATA_AND_ALERT"
  database = var.prod
  schema   = "DBT_TESTS"
  language = "JAVASCRIPT"

  comment             = "Read the dbt_tests schema and alert back which tests have rows which means fails"
  return_type         = "varchar"
  execute_as          = "CALLER"
  return_behavior     = "IMMUTABLE"
  statement           = <<EOT
try {
  var result = "No data in DBT_TESTS";
  var failedTables = [];
 
  // Check for the existence of tables in the DBT_TESTS schema
  var state1 = snowflake.createStatement({
    sqlText: "SHOW TABLES IN SCHEMA DBT_TESTS;"
  });
 
  var tables = state1.execute();
  while (tables.next()) {
    var tableName = tables.getColumnValue(2);
    var rowCount = tables.getColumnValue("rows");
    // Check if the table has at least one row of data
    if (rowCount > 0) {
      var script = "SELECT * FROM " + tables.getColumnValue(3) + ".DBT_TESTS." + tableName;
      failedTables.push({
        tableName: tableName,
        rowCount: rowCount,
        script: script
      });
    }
  }
 
  // Send a single email if there are failed tables
  if (failedTables.length > 0) {
    var emailContent = "Alert: Data found in the following DBT_TESTS tables:\n\n";
 
    for (var i = 0; i < failedTables.length; i++) {
      var tableInfo = failedTables[i];
      emailContent += "Table: " + tableInfo.tableName + ", Row Count: "+ tableInfo.rowCount + "\nScript: "+ tableInfo.script + "\n\n";
    }
 
    // Send an alert using the notification integration
    var state2 = snowflake.createStatement({
      sqlText: "CALL SYSTEM$SEND_EMAIL('dbt_test_failures', '2e36f225.ivyrehab.onmicrosoft.com@amer.teams.ms', 'dbt Testing Failures', :1)",
      binds: [emailContent]
    });
    var alertResult = state2.execute();
    result = "Alert: Data found in DBT_TESTS. Check email for details.";
  }
} catch (e) {
  // Handle any errors that occur during the execution of the procedure
  console.error("Error occurred while checking DBT test data:", e);
  result = "Error checking DBT test data: " + e.message;
}
 
return result;
EOT
}

resource "snowflake_procedure" "check_raintree_ingestion_log" {
  name     = "CHECK_RAINTREE_INGESTION_LOG_AND_ALERT"
  database = var.landing
  schema   = "RAINTREE"
  language = "JAVASCRIPT"

  comment             = "Check the raintree ingestion"
  return_type         = "VARCHAR(16777216)"
  execute_as          = "CALLER"
  return_behavior     = "VOLATILE"
  statement           = <<EOT
  try {
    var failedTables = []; // Array to store failed tables information

    // SQL query to select required columns from INGESTION_FAIL_LOG
    var query = "SELECT FAIL_DATE, BATCHNUMBER, TABLENAME, FAILAREA, ERROR FROM INGESTION_FAIL_LOG";

    // Execute the query
    var statement1 = snowflake.createStatement({ sqlText: query });
    var resultSet1 = statement1.execute();

    // Loop through the result set and add each row to the array
    while (resultSet1.next()) {
        var failDate = resultSet1.getColumnValue(1);
        var batchNumber = resultSet1.getColumnValue(2);
        var tableName = resultSet1.getColumnValue(3);
        var failArea = resultSet1.getColumnValue(4);
        var error = resultSet1.getColumnValue(5);

        // Add the row information to the array
        failedTables.push({
            tableName: tableName,
            failDate: failDate,
            batchNumber: batchNumber,
            failArea: failArea,
            error: error
        });
    }

    // Send a single email if there are failed tables
    if (failedTables.length > 0) {
        var emailContent = "Alert: Data found in the following tables:\\n\\n";

        for (var i = 0; i < failedTables.length; i++) {
            var tableInfo = failedTables[i];
            emailContent += "Table: " + tableInfo.tableName + ",\n Batch Number: " + tableInfo.batchNumber + ",\n Fail Date: " + tableInfo.failDate + ",\n Fail Area: " + tableInfo.failArea + ",\n Error: " + tableInfo.error + "\n\n";
        }

        // Add the advice to truncate the table after fixing or acknowledging errors
        emailContent += "Please truncate the table after fixing or acknowledging errors.";

        // Send an alert using the notification integration
        var state2 = snowflake.createStatement({
            sqlText: "CALL SYSTEM$SEND_EMAIL('raintree_ingestion_failures', '735b3d11.ivyrehab.onmicrosoft.com@amer.teams.ms', 'Ingestion Failures', :1)",
            binds: [emailContent]
        });
        var alertResult = state2.execute();

        return "Alert: Data found in INGESTION_FAIL_LOG. Check email for details.";
    } else {
        return "No failed tables found in INGESTION_FAIL_LOG.";
    }
} catch (err) {
    // Handle any errors that may occur
    return "Error: " + err;
}
EOT
}

resource "snowflake_procedure" "create_audit_table_and_insert_data" {
  name     = "CREATE_AUDIT_TABLE_AND_INSERT_DATA"
  database = var.landing
  schema   = "RAINTREE"
  language = "JAVASCRIPT"

  arguments {
    name = "BATCH_NUMBER"
    type = "varchar"
  }

  comment             = "Create Audit Table And Insert Data"
  return_type         = "VARCHAR(16777216)"
  execute_as          = "CALLER"
  return_behavior     = "IMMUTABLE"
  statement           = <<EOF
  try {
    // Set the default schema for the session
    var setSchemaQuery = `USE SCHEMA LANDING.RAINTREE`;
    snowflake.execute({ sqlText: setSchemaQuery });

    var auditTableName = 'RAINTREE_COPY_HISTORY'
    
     // Get the list of file names
    var getStageFilesSQL = `list @SNOWFLAKE_RAINTREE_STAGE PATTERN='.*incremental\\/$${BATCH_NUMBER}/*.*\\.parquet'`;
    var fileListResultSet = snowflake.execute({ sqlText: getStageFilesSQL });

    // Declare an array to store all file names
    var allFileNames = [];

    // Loop through the result set and extract all file names
    while (fileListResultSet.next()) {
        var fileName = fileListResultSet.getColumnValue(1);
        allFileNames.push(fileName);
    }
    var processedTables = [];

    // Iterate through the filtered parquetFileNames array
    for (var i = 0; i < allFileNames.length; i++) {
        var fullFileName = allFileNames[i];

        // Extract the table name
        var tableName = fullFileName.split('/')[6];



        // Check if the table has already been processed
        if (processedTables.includes(tableName)) {
            // Skip processing if the table has been processed before
            continue;
        }
        // Add the current table to the list of processed tables
        processedTables.push(tableName);

    }
    

    // Create the audit table with all columns from information_schema.copy_history
   var createAuditTableSQL = `
    CREATE TABLE IF NOT EXISTS $${auditTableName} (
        ID number identity start 1 increment 1,
        FILE_NAME VARCHAR(16777216),
        STAGE_LOCATION VARCHAR(16777216),
        LAST_LOAD_TIME TIMESTAMP_LTZ(3),
        ROW_COUNT NUMBER(38,0),
        ROW_PARSED NUMBER(38,0),
        FILE_SIZE NUMBER(38,0),
        FIRST_ERROR_MESSAGE VARCHAR(16777216),
        FIRST_ERROR_LINE_NUMBER NUMBER(38,0),
        FIRST_ERROR_CHARACTER_POS NUMBER(38,0),
        FIRST_ERROR_COLUMN_NAME VARCHAR(16777216),
        ERROR_COUNT NUMBER(38,0),
        ERROR_LIMIT NUMBER(38,0),
        STATUS VARCHAR(16777216),
        TABLE_CATALOG_NAME VARCHAR(16777216),
        TABLE_SCHEMA_NAME VARCHAR(16777216),
        TABLE_NAME VARCHAR(16777216),
        PIPE_CATALOG_NAME VARCHAR(16777216),
        PIPE_SCHEMA_NAME VARCHAR(16777216),
        PIPE_NAME VARCHAR(16777216),
        PIPE_RECEIVED_TIME TIMESTAMP_LTZ(3),
        FILE_LAST_MODIFIED TIMESTAMP_LTZ(3)
    );
`;
    snowflake.execute({ sqlText: createAuditTableSQL });

    for (var j = 0; j < processedTables.length; j++) {
     var lowerTableName = processedTables[j].toLowerCase();
     
    


    var listCommand = `ls @SNOWFLAKE_RAINTREE_STAGE PATTERN='.*incremental\\/$${BATCH_NUMBER}\\/$${lowerTableName}.*\\.parquet'`;
    snowflake.execute({ sqlText: listCommand});

    // Fetch data using the provided pattern and insert into the newly created audit table
var insertAuditTableSQL = `
    INSERT INTO $${auditTableName} (
        FILE_NAME,
        STAGE_LOCATION,
        LAST_LOAD_TIME,
        ROW_COUNT,
        ROW_PARSED,
        FILE_SIZE,
        FIRST_ERROR_MESSAGE,
        FIRST_ERROR_LINE_NUMBER,
        FIRST_ERROR_CHARACTER_POS,
        FIRST_ERROR_COLUMN_NAME,
        ERROR_COUNT,
        ERROR_LIMIT,
        STATUS,
        TABLE_CATALOG_NAME,
        TABLE_SCHEMA_NAME,
        TABLE_NAME,
        PIPE_CATALOG_NAME,
        PIPE_SCHEMA_NAME,
        PIPE_NAME,
        PIPE_RECEIVED_TIME,
        FILE_LAST_MODIFIED
    )
    WITH external_stage (file_name, file_last_modified) AS (
        SELECT
            REGEXP_SUBSTR("name", '.*prd-rbi-datalake-extract-i00255\\/(.*)', 1, 1, 'e'),
            "last_modified"
        FROM TABLE(RESULT_SCAN(LAST_QUERY_ID()))
    )
    SELECT
        CH.*,
        TO_TIMESTAMP(ES.FILE_LAST_MODIFIED, 'Dy, DD Mon YYYY HH24:MI:SS GMT') AS FILE_LAST_MODIFIED
    FROM TABLE(
        INFORMATION_SCHEMA.COPY_HISTORY(
            TABLE_NAME=>'$${lowerTableName}',
            START_TIME=> DATEADD(days, -14, CURRENT_TIMESTAMP())
        )
    ) CH
    JOIN EXTERNAL_STAGE ES ON CH.FILE_NAME = ES.FILE_NAME
    WHERE CH.FILE_NAME LIKE '%incremental/$${BATCH_NUMBER}/$${lowerTableName}%parquet';
`;

snowflake.execute({ sqlText: insertAuditTableSQL });
}


var cleanupDuplicatesSQL = `
    DELETE FROM $${auditTableName}
USING (
    SELECT
        FILE_NAME,
        LAST_LOAD_TIME,
        ID,
        ROW_NUMBER() OVER (PARTITION BY FILE_NAME ORDER BY LAST_LOAD_TIME DESC) AS rnk
    FROM $${auditTableName}
) AS dupes
WHERE $${auditTableName}.FILE_NAME = dupes.FILE_NAME
    AND $${auditTableName}.LAST_LOAD_TIME = dupes.LAST_LOAD_TIME
    AND rnk > 1;
`;

// Execute the cleanup duplicates statement
snowflake.execute({ sqlText: cleanupDuplicatesSQL });



    return 'Audit table created and data inserted successfully.';
} catch (err) {
    return 'Error: ' + err;
}
EOF
}

resource "snowflake_procedure" "parent_ingest_raintree_v2_data" {
  name     = "PARENT_INGEST_RAINTREE_V2_DATA"
  database = var.landing
  schema   = "RAINTREE"
  language = "JAVASCRIPT"

  arguments {
    name = "RERUN"
    type = "BOOLEAN"
  }

  comment             = "Kickoff Ingest Raintree v2 data."
  return_type         = "VARCHAR(16777216)"
  execute_as          = "CALLER"
  return_behavior     = "IMMUTABLE"
  statement           = <<EOF
  try{


// Set the default schema for the session
var setSchemaQuery = `USE SCHEMA LANDING.RAINTREE`;
snowflake.execute({ sqlText: setSchemaQuery });

// Get the list of file names
var getStageFilesSQL = `list @SNOWFLAKE_RAINTREE_STAGE`;
var fileListResultSet = snowflake.execute({ sqlText: getStageFilesSQL });

// Declare an array to store all file names
var allFileNames = [];

// Loop through the result set and extract all file names
while (fileListResultSet.next()) {
    var fileName = fileListResultSet.getColumnValue(1);
    allFileNames.push(fileName);
}

// Filter the array to include only file names that end with ".parquet"
var parquetFilePaths = allFileNames.filter(fileName => fileName.endsWith(".parquet"));

// Find largest batch number in stage
    var largestStageBatch = -1;
    for (i = 0; i < parquetFilePaths.length; i++){
        var fullFileName = parquetFilePaths[i];
        var batchNumber = parseInt(fullFileName.split('/')[5]);
        if (batchNumber > largestStageBatch){
            largestStageBatch = batchNumber
        }
    }


// Find largest batch number in audit
    var largestAuditBatch = -1;
    var setAuditQuery = `SELECT MAX(BATCH_NUMBER) as batch_number FROM EXECUTION_AUDIT WHERE STATUS = 'SUCCESS'`;
    var largestAudit = snowflake.execute({ sqlText: setAuditQuery });
    while (largestAudit.next()) {
        var batchNum = largestAudit.getColumnValue(1);
        if (batchNum > largestAuditBatch){
            largestAuditBatch = batchNum
        }
  }

// Loop through batch diff, call ingest procedure for each batch
    //var tempTableQuery = `CREATE OR REPLACE TEMPORARY TABLE mytemptable (id VARCHAR, RERUN BOOLEAN)`;
    //snowflake.execute({ sqlText: tempTableQuery });
    
    for (i = largestAuditBatch + 1; i <= largestStageBatch; i++){
            //Set batch num for use in error logs below
            var failureBatchNum = i
            // Call Ingestion Procedure
            var callProcedureSQL = `CALL INGEST_RAINTREE_V2_DATA('SNOWFLAKE_RAINTREE_STAGE', '$${i}', '$${RERUN}');`;
            try {
            snowflake.execute({ sqlText: callProcedureSQL });
            }
            catch(err){
                var callFailLogSQL = `CALL INSERT_INGESTION_FAIL_LOG('$${failureBatchNum}','Failure in ingest_raintree_v2_data', '--','$${err}')`;
                var logFail = snowflake.execute({ sqlText: callFailLogSQL });
            }
            
            // Generate GUID & current timestamp for execution
            var guid = generateGUID()
            var curr_date = Date.now()
            
            // write success to execution audit table
            var setSuccessQuery = `INSERT INTO EXECUTION_AUDIT VALUES ('$${guid}', '$${curr_date}', '$${curr_date}', 'SUCCESS', '$${i}')`;
            try {
                snowflake.execute({ sqlText: setSuccessQuery });
            }
            catch(err){
                var callFailLogSQL = `CALL INSERT_INGESTION_FAIL_LOG('$${failureBatchNum}','Failure to add values to execution audit', '--','$${err}')`;
                var logFail = snowflake.execute({ sqlText: callFailLogSQL });
            }

            var ingestionCopyHistory = `CALL CREATE_AUDIT_TABLE_AND_INSERT_DATA('$${i}')`;
            try{
                snowflake.execute({ sqlText: ingestionCopyHistory });
            }
            catch(err){
                var callFailLogSQL = `CALL INSERT_INGESTION_FAIL_LOG('$${failureBatchNum}','Failure to call ingestion audit', '--','$${err}')`;
                var logFail = snowflake.execute({ sqlText: callFailLogSQL });
            }

            var alertingResult = `CALL CHECK_RAINTREE_INGESTION_LOG_AND_ALERT();`
            snowflake.execute({ sqlText: alertingResult });
        }
}
catch (err) {
        // write failure to ingestion failure table table
            var callFailLogSQL = `CALL INSERT_INGESTION_FAIL_LOG('$${failureBatchNum}','Failure to ingest batch', '--','$${err}')`;
            var logFail = snowflake.execute({ sqlText: callFailLogSQL });
        // Write failure to execution audit table
            var guid = generateGUID()
            var curr_date = Date.now()
            var setFailureQuery = `INSERT INTO EXECUTION_AUDIT VALUES ('$${guid}', '$${curr_date}', '$${curr_date}', 'FAILURE', '$${failureBatchNum}' )`;
            snowflake.execute({ sqlText: setFailureQuery });
}

    function generateGUID() {
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
        var r = Math.random() * 16 | 0,
            v = c === 'x' ? r : (r & 0x3 | 0x8);
        return v.toString(16);
    });
    }
    EOF
}

resource "snowflake_procedure" "child_ingest_raintree_v2_data" {
  name     = "INGEST_RAINTREE_V2_DATA"
  database = var.landing
  schema   = "RAINTREE"
  language = "JAVASCRIPT"

  arguments {
    name = "STAGE_NAME"
    type = "varchar"
  }
  arguments {
    name = "BATCH_ID"
    type = "varchar"
  }
    arguments {
    name = "RE_RUN"
    type = "BOOLEAN"
  }

  comment             = "Ingest Raintree v2 data."
  return_type         = "VARCHAR(16777216)"
  execute_as          = "CALLER"
  return_behavior     = "IMMUTABLE"
  statement           = <<EOF
  try {

// Set the default schema for the session
    var setSchemaQuery = `USE SCHEMA LANDING.RAINTREE`;
    snowflake.execute({ sqlText: setSchemaQuery });

// Get the list of file names
    var getStageFilesSQL = `list @$${STAGE_NAME}`;
    
    var fileListResultSet = snowflake.execute({ sqlText: getStageFilesSQL });

// Declare an array to store all file names
    var allFileNames = [];

    // Loop through the result set and extract all file names
    while (fileListResultSet.next()) {
        var fileName = fileListResultSet.getColumnValue(1);
        allFileNames.push(fileName);
    }

    // Filter the array to include only file names that end with ".parquet"
    var parquetFilePathes = allFileNames.filter(fileName => fileName.endsWith(".parquet"));
    
    var filteredFilesPathes  = parquetFilePathes.filter(file => file.includes("/"+BATCH_ID+"/"));

    // Declare an array to store all table names
    var allTableNames = [];

    var dataInsertedCounter = 0;
    var tableCreatedCounter = 0;
    // Iterate through the filtered filteredFilesPathes array
    for (var i = 0; i < filteredFilesPathes.length; i++) {
        var fullFileName = filteredFilesPathes[i];

        // Extract the table name
        var extractedtableName = fullFileName.split('/')[6];   
        allTableNames.push(extractedtableName);
    }

    var uniqueTableNames = [...new Set(allTableNames)];

     for (var i = 0; i < uniqueTableNames.length; i++) {
        // Check conditions before calling the procedure
        var tableName = uniqueTableNames[i];
        if (tableName !== null) {    

            var callProcedureSQL = `CALL INFER_SCHEMA_AND_COPY_DATA('$${BATCH_ID}', '$${tableName}', '$${RE_RUN}');`;
    
               try {
                var result = snowflake.execute({ sqlText: callProcedureSQL });
                dataInsertedCounter++;

                if (result.next()) {
                    // Extract the return message from the procedure
                    tableCreatedCounter += parseInt(result.getColumnValue(1));
                }
            } catch (error) {
                // Handle the error here (send alert, log into a table, etc.)
                var callFailLogSQL = `CALL INSERT_INGESTION_FAIL_LOG('$${BATCH_ID}','Attempt to call Infer_Schema_and_Copy_Data', '$${tableName}','$${error}')`;
    var logFail = snowflake.execute({ sqlText: callFailLogSQL });

            }
        }
    }
    
    return dataInsertedCounter + " table(s) were processed in batch " + BATCH_ID + " and " + tableCreatedCounter + " tables were created";
}
catch (err) {
    var callFailLogSQL = `CALL INSERT_INGESTION_FAIL_LOG('--','Failure in Ingest_Raintree_v2', '--','$${err}')`;
    var logFail = snowflake.execute({ sqlText: callFailLogSQL });
}
EOF
}

resource "snowflake_procedure" "insert_ingestion_fail_log" {
  name     = "INSERT_INGESTION_FAIL_LOG"
  database = var.landing
  schema   = "RAINTREE"
  language = "JAVASCRIPT"

  arguments {
    name = "BATCH_NUMBER"
    type = "varchar"
  }
  arguments {
    name = "FAIL_AREA"
    type = "varchar"
  }
    arguments {
    name = "TABLE_NAME"
    type = "varchar"
  }

  arguments {
    name = "ERROR"
    type = "varchar"
  }

  comment             = "Inserts records into the Ingestion Fail Log table."
  return_type         = "VARCHAR(16777216)"
  execute_as          = "CALLER"
  return_behavior     = "IMMUTABLE"
  statement           = <<EOF
  try {
    // Set the schema and table names
    var schemaName = 'RAINTREE';
    var tableName = 'INGESTION_FAIL_LOG';

    // Check if the table exists
    var tableExistsQuery = `SELECT COUNT(*) AS TABLE_COUNT FROM information_schema.tables WHERE table_schema = '$${schemaName}' AND table_name = '$${tableName}'`;
    var tableExistsResult = snowflake.execute({sqlText: tableExistsQuery});
    
    if (tableExistsResult.next() && tableExistsResult.getColumnValue('TABLE_COUNT') > 0) {
        // Table exists, insert data
        var insertQuery = `INSERT INTO $${tableName} (fail_date, batchNumber, tableName, failArea, error) VALUES (CURRENT_DATE(), :1, :2, :3, :4)`;
        snowflake.execute({sqlText: insertQuery, binds: [BATCH_NUMBER, TABLE_NAME, FAIL_AREA, ERROR]});
        
        return 'Data inserted into ' + tableName + ' successfully.';
    } else {
        // Table does not exist, create it
        var createTableQuery = `CREATE TABLE $${tableName} (fail_date DATE, batchNumber VARCHAR, tableName VARCHAR, failArea VARCHAR, error VARCHAR)`;
        snowflake.execute({sqlText: createTableQuery});

        // Insert data into the newly created table
        var insertQuery = `INSERT INTO $${tableName} (fail_date, batchNumber, tableName, failArea, error) VALUES (CURRENT_DATE(), :1, :2, :3, :4)`;
        snowflake.execute({sqlText: insertQuery, binds: [BATCH_NUMBER, TABLE_NAME, FAIL_AREA, ERROR]});

        return 'Table ' + tableName + ' created and data inserted successfully.';
    }
} catch (err) {
    return 'Error: ' + err;
}
EOF
}

resource "snowflake_procedure" "infer_schema_and_copy_data" {
  name     = "INFER_SCHEMA_AND_COPY_DATA"
  database = var.landing
  schema   = "RAINTREE"
  language = "JAVASCRIPT"

  arguments {
    name = "BATCH_ID"
    type = "varchar"
  }
  arguments {
    name = "INCREMENT_TABLE_NAME"
    type = "varchar"
  }
    arguments {
    name = "RE_RUN"
    type = "BOOLEAN"
  }


  comment             = "Update Stage."
  return_type         = "VARCHAR(16777216)"
  execute_as          = "CALLER"
  return_behavior     = "IMMUTABLE"
  statement           = <<EOF
  try {

    // Set the default schema for the session
    var setSchemaQuery = `USE SCHEMA LANDING.RAINTREE`;
    snowflake.execute({ sqlText: setSchemaQuery });


    //Check if the table already exists
    var uppercaseTableName = INCREMENT_TABLE_NAME.toUpperCase();
    var tableCountSQL = `SELECT COUNT(*) from INFORMATION_SCHEMA.TABLES 
                    WHERE TABLE_NAME = '$${uppercaseTableName}'
                    ;`;
    var tableCountResult = snowflake.execute({ sqlText: tableCountSQL });
    var tableCount = tableCountResult.next() ? tableCountResult.getColumnValue(1) : null;

    //Values to return to Ingest Raintree V2 Stored Procedure
    var dataInsertedCounter = 0;
    var tableCreatedCounter = 0;

    //if statement to check to see if the table exists

        if (tableCount > 0) {
           
            if (RE_RUN == true) {
                deleteDataIfExists(BATCH_ID,INCREMENT_TABLE_NAME);
            }
            
            //Calls the "Copy Into" sql statement to ingest data into the table that already exists
            try {
                var result = insertDataToTable(BATCH_ID, INCREMENT_TABLE_NAME, RE_RUN);
            } catch (err) {
                var callFailLogSQL;

                // Retry logic for schema evolution error
                var retryCount = 0;
                while (retryCount < 1) {
                    try {
                        if (err.includes("Schema evolution is incomplete. The data was not loaded. The table schema was updated as per new schema.")) {
                            var tableRetrySQL = CALL INFER_SCHEMA_AND_COPY_DATA(BATCH_ID, INCREMENT_TABLE_NAME, RE_RUN);
                            var tableRetry = snowflake.execute({ sqlText: tableRetrySQL });
                            callFailLogSQL = `CALL INSERT_INGESTION_FAIL_LOG('$${BATCH_ID}','Failure to insert data to table', '$${INCREMENT_TABLE_NAME}','Schema Evolution Retry Successful')`;
                            break; // Break the loop on successful retry
                        }
                    } catch (retryErr) {
                        // Log retry failure
                        callFailLogSQL = `CALL INSERT_INGESTION_FAIL_LOG('$${BATCH_ID}','Failure to insert data to table', '$${INCREMENT_TABLE_NAME}','Schema Evolution Retry Failed')`;
                    }
                    retryCount++;
                }

                // If retry was not successful, log the original error
                if (!callFailLogSQL) {
                    callFailLogSQL = `CALL INSERT_INGESTION_FAIL_LOG('$${BATCH_ID}','Failure to insert data to table', '$${INCREMENT_TABLE_NAME}','$${err}')`;
                }

                var logFail = snowflake.execute({ sqlText: callFailLogSQL });
            }
            

            dataInsertedCounter++; 
              
        }
        else
        {
           //Creates Table
           try {
                var createTableResult = inferTableSchema(BATCH_ID, INCREMENT_TABLE_NAME);
            } catch (err) {
                var callFailLogSQL = `CALL INSERT_INGESTION_FAIL_LOG('$${BATCH_ID}','Failure to create table', '$${INCREMENT_TABLE_NAME}','$${err}')`;
                var logFail = snowflake.execute({ sqlText: callFailLogSQL });
            }

           grantPermissionToRole(INCREMENT_TABLE_NAME);
           enableSchemaEvolution(INCREMENT_TABLE_NAME);
           enableChangeTracking(INCREMENT_TABLE_NAME);
           
           //Insert Data into created Table
            try {
                var result = insertDataToTable(BATCH_ID, INCREMENT_TABLE_NAME, RE_RUN);
            } catch (err) {
                var callFailLogSQL;

                // Retry logic for schema evolution error
                var retryCount = 0;
                while (retryCount < 1) {
                    try {
                        if (err.includes("Schema evolution is incomplete. The data was not loaded. The table schema was updated as per new schema.")) {
                            var tableRetrySQL = CALL INFER_SCHEMA_AND_COPY_DATA(BATCH_ID, INCREMENT_TABLE_NAME, RE_RUN);
                            var tableRetry = snowflake.execute({ sqlText: tableRetrySQL });
                            callFailLogSQL = `CALL INSERT_INGESTION_FAIL_LOG('$${BATCH_ID}','Failure to insert data to table', '$${INCREMENT_TABLE_NAME}','Schema Evolution Retry Successful')`;
                            break; // Break the loop on successful retry
                        }
                    } catch (retryErr) {
                        // Log retry failure
                        callFailLogSQL = `CALL INSERT_INGESTION_FAIL_LOG('$${BATCH_ID}','Failure to insert data to table', '$${INCREMENT_TABLE_NAME}','Schema Evolution Retry Failed')`;
                    }
                    retryCount++;
                }

                // If retry was not successful, log the original error
                if (!callFailLogSQL) {
                    callFailLogSQL = `CALL INSERT_INGESTION_FAIL_LOG('$${BATCH_ID}','Failure to insert data to table', '$${INCREMENT_TABLE_NAME}','$${err}')`;
                }

                var logFail = snowflake.execute({ sqlText: callFailLogSQL });
            }


           dataInsertedCounter++; 
           tableCreatedCounter++;
        }
        
    return tableCreatedCounter;    
  } catch (err) {
    var callFailLogSQL = `CALL INSERT_INGESTION_FAIL_LOG('$${BATCH_ID}','Failure when running infer_schema_and_copy_data', '$${INCREMENT_TABLE_NAME}','$${err}')`;
    var logFail = snowflake.execute({ sqlText: callFailLogSQL });
}

function insertDataToTable(batchId, tableName, reRun) {

    // Step 1: Load data into the table without BATCH_ID
    var COPY_SQL = `
        COPY INTO $${tableName}
        FROM @snowflake_raintree_stage/i00255/incremental/$${batchId}/$${tableName}/
        PATTERN = '.*[.]parquet'
        FILE_FORMAT = (TYPE = PARQUET)
        FORCE = $${reRun ? 'TRUE' : 'FALSE'}
        MATCH_BY_COLUMN_NAME = CASE_INSENSITIVE
    `;

    snowflake.execute({ sqlText: COPY_SQL });

     // Step 2: Add the BATCH_ID column if it doesnt exist
    var ADD_COLUMN_SQL = `
              ALTER TABLE $${tableName}
              ADD COLUMN IF NOT EXISTS BATCH_ID VARCHAR; 
        `;      
    snowflake.execute({ sqlText: ADD_COLUMN_SQL });

    // Step 3: Set the BATCH_ID for newly inserted rows
    var UPDATE_SQL = `
              UPDATE $${tableName}
              SET BATCH_ID = '$${batchId}'
              WHERE BATCH_ID IS NULL OR BATCH_ID = '';
        `;      
    snowflake.execute({ sqlText: UPDATE_SQL });
}

function inferTableSchema(batchName, tableName) {
    // Create the table with inferred schema
    var CREATE_TABLE_SQL = `
        CREATE OR REPLACE TABLE $${tableName}
        USING TEMPLATE (
            SELECT ARRAY_AGG(object_construct(*))
            FROM TABLE(
                INFER_SCHEMA(
                    LOCATION => '@snowflake_raintree_stage/i00255/incremental/$${batchName}/$${tableName}/',
                    FILE_FORMAT => 'PARQUET_FORMAT',
                    IGNORE_CASE => true
                )
            )
        )
    `;
    
    snowflake.execute({ sqlText: CREATE_TABLE_SQL });

    // Add BATCH_ID column to the table
    var ADD_BATCH_ID_SQL = `ALTER TABLE $${tableName} ADD COLUMN BATCH_ID VARCHAR;`;
    snowflake.execute({ sqlText: ADD_BATCH_ID_SQL });
}

//Permission Granting to table needed for certain functions
function grantPermissionToRole(tableName){
    var GRANT_PERMISSION_SQL = `GRANT EVOLVE SCHEMA ON TABLE $${tableName} TO ROLE ACCOUNTADMIN;`;
    return snowflake.execute({ sqlText: GRANT_PERMISSION_SQL });
}

function enableSchemaEvolution(tableName){
    var ENABLE_SCHEMA_EVOLUTION_SQL = `ALTER TABLE $${tableName} SET ENABLE_SCHEMA_EVOLUTION = true;`;
    return snowflake.execute({ sqlText: ENABLE_SCHEMA_EVOLUTION_SQL });
}

function enableChangeTracking(tableName){
    var ENABLE_CHANGE_TRACKING_SQL = `ALTER TABLE $${tableName} SET CHANGE_TRACKING = TRUE;`;
    return snowflake.execute({ sqlText: ENABLE_CHANGE_TRACKING_SQL });
}

function deleteDataIfExists(batchId, tableName) {

   // Delete records if exists for re-run purpose
    var DELETE_SQL = `
        DELETE 
        FROM $${tableName} RTT
        WHERE RTT.BATCH_ID = '$${batchId}'
    `;
    
    
     try {
            snowflake.execute({ sqlText: DELETE_SQL });
      } catch (err) {
                var callFailLogSQL = `CALL INSERT_INGESTION_FAIL_LOG('$${batchId}','Failure to delete data if exists', '$${tableName}','$${err}')`;
                var logFail = snowflake.execute({ sqlText: callFailLogSQL });
     }

}
EOF
}