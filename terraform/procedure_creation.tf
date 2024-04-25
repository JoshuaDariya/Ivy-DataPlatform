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

resource "snowflake_procedure" "prod_dbttests_alerts" {
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
  var today = new Date();
  var yesterday = new Date(today);
  yesterday.setDate(today.getDate() - 1);

  // Format the date as YYYY-MM-DD
  var formatDate = (date) => date.toISOString().split('T')[0];

  var failedTables = [];

  // Ensure the single results table exists with a date column
  var ensureTableState = snowflake.createStatement({
    sqlText: `CREATE TABLE IF NOT EXISTS PROD.DBT_TESTS.FAILED_TABLES (tableName STRING, rowCount NUMBER, script STRING, failureDate DATE);`
  });
  ensureTableState.execute();

  // Find failed tables and insert into the results table with todays date
  var state1 = snowflake.createStatement({
    sqlText: "SHOW TABLES IN SCHEMA PROD.DBT_TESTS;"
  });

  var tables = state1.execute();
  while (tables.next()) {
    var tableName = tables.getColumnValue(2);
    var rowCount = tables.getColumnValue("rows");
    if (rowCount > 0) {
      var script = "SELECT * FROM " + tables.getColumnValue(3) + ".DBT_TESTS." + tableName;
      failedTables.push({
        tableName: tableName,
        rowCount: rowCount,
        script: script
      });

      // Insert into the single failed table with todays date
      var insertState = snowflake.createStatement({
        sqlText: `INSERT INTO PROD.DBT_TESTS.FAILED_TABLES VALUES(:1, :2, :3, :4);`,
        binds: [tableName, rowCount, script, formatDate(today)]
      });
      insertState.execute();
    }
  }

  // Find new failures by comparing records inserted today with those inserted yesterday
  var newFailuresState = snowflake.createStatement({
    sqlText: `SELECT tableName FROM PROD.DBT_TESTS.FAILED_TABLES WHERE failureDate = :1
              EXCEPT
              SELECT tableName FROM PROD.DBT_TESTS.FAILED_TABLES WHERE failureDate = :2;`,
    binds: [formatDate(today), formatDate(yesterday)]
  });
  var newFailures = newFailuresState.execute();
  var newFailedTables = [];
  while (newFailures.next()) {
    newFailedTables.push(newFailures.getColumnValue(1)); // Assuming the first column is tableName
  }

  // Adjust the email content to include only the new failed tables
  if (newFailedTables.length > 0) {
    var emailContent = "Alert: New data found in DBT_TESTS tables today ("+formatDate(today)+"):\n\n";

    newFailedTables.forEach(tableName => {
      emailContent += "Table: " + tableName + "\n\n";
    });

    var state2 = snowflake.createStatement({
      sqlText: `CALL SYSTEM$SEND_EMAIL('"dbt_test_failures"','${var.alerts_email}', 'PROD dbt Testing Failures', :1);`,
      binds: [emailContent]
    });
    state2.execute();
    return "Alert: New data found in DBT_TESTS. Check email for details.";
  }
  else {
    var emailContent2 = "No new failures found";
    var state3 = snowflake.createStatement({
      sqlText: `CALL SYSTEM$SEND_EMAIL('"dbt_test_failures"', '${var.alerts_email}', 'PROD dbt Testing Success', :1);`,
      binds: [emailContent2]
    });
    state3.execute();
    return "No new failures found";
  }
} catch (e) {
  console.error("Error occurred while checking DBT test data:", e);
  return "Error checking DBT test data: " + e.message;
}
EOT
}


resource "snowflake_procedure" "qa_dbttests_alerts" {
  name     = "CHECK_DBT_TESTS_DATA_AND_ALERT"
  database = var.qa
  schema   = "DBT_TESTS"
  language = "JAVASCRIPT"

  comment             = "Read the dbt_tests schema and alert back which tests have rows which means fails"
  return_type         = "varchar"
  execute_as          = "CALLER"
  return_behavior     = "IMMUTABLE"
  statement           = <<EOT
try {
  var today = new Date();
  var yesterday = new Date(today);
  yesterday.setDate(today.getDate() - 1);

  // Format the date as YYYY-MM-DD
  var formatDate = (date) => date.toISOString().split('T')[0];

  var failedTables = [];

  // Ensure the single results table exists with a date column
  var ensureTableState = snowflake.createStatement({
    sqlText: `CREATE TABLE IF NOT EXISTS QA.DBT_TESTS.FAILED_TABLES (tableName STRING, rowCount NUMBER, script STRING, failureDate DATE);`
  });
  ensureTableState.execute();

  // Find failed tables and insert into the results table with todays date
  var state1 = snowflake.createStatement({
    sqlText: "SHOW TABLES IN SCHEMA QA.DBT_TESTS;"
  });

  var tables = state1.execute();
  while (tables.next()) {
    var tableName = tables.getColumnValue(2);
    var rowCount = tables.getColumnValue("rows");
    if (rowCount > 0) {
      var script = "SELECT * FROM " + tables.getColumnValue(3) + ".DBT_TESTS." + tableName;
      failedTables.push({
        tableName: tableName,
        rowCount: rowCount,
        script: script
      });

      // Insert into the single failed table with todays date
      var insertState = snowflake.createStatement({
        sqlText: `INSERT INTO QA.DBT_TESTS.FAILED_TABLES VALUES(:1, :2, :3, :4);`,
        binds: [tableName, rowCount, script, formatDate(today)]
      });
      insertState.execute();
    }
  }

  // Find new failures by comparing records inserted today with those inserted yesterday
  var newFailuresState = snowflake.createStatement({
    sqlText: `SELECT tableName FROM QA.DBT_TESTS.FAILED_TABLES WHERE failureDate = :1
              EXCEPT
              SELECT tableName FROM QA.DBT_TESTS.FAILED_TABLES WHERE failureDate = :2;`,
    binds: [formatDate(today), formatDate(yesterday)]
  });
  var newFailures = newFailuresState.execute();
  var newFailedTables = [];
  while (newFailures.next()) {
    newFailedTables.push(newFailures.getColumnValue(1)); // Assuming the first column is tableName
  }

  // Adjust the email content to include only the new failed tables
  if (newFailedTables.length > 0) {
    var emailContent = "Alert: New data found in DBT_TESTS tables today ("+formatDate(today)+"):\n\n";

    newFailedTables.forEach(tableName => {
      emailContent += "Table: " + tableName + "\n\n";
    });

    var state2 = snowflake.createStatement({
      sqlText: `CALL SYSTEM$SEND_EMAIL('"dev_qa_dbt_test_failures"', '${var.dev_qa_alerts_email}', 'QA dbt Testing Failures', :1);`,
      binds: [emailContent]
    });
    state2.execute();
    return "Alert: New data found in DBT_TESTS. Check email for details.";
  }
  else {
    var emailContent2 = "No new failures found";
    var state3 = snowflake.createStatement({
      sqlText: `CALL SYSTEM$SEND_EMAIL('"dev_qa_dbt_test_failures"', '${var.dev_qa_alerts_email}', 'QA dbt Testing Success', :1);`,
      binds: [emailContent2]
    });
    state3.execute();
    return "No new failures found";
  }
} catch (e) {
  console.error("Error occurred while checking DBT test data:", e);
  return "Error checking DBT test data: " + e.message;
}
EOT
}

resource "snowflake_procedure" "dev_dbttests_alerts" {
  name     = "CHECK_DBT_TESTS_DATA_AND_ALERT"
  database = var.dev
  schema   = "DBT_TESTS"
  language = "JAVASCRIPT"

  comment             = "Read the dbt_tests schema and alert back which tests have rows which means fails. Also check the previous day's failures to prevent sending stale alerts"
  return_type         = "varchar"
  execute_as          = "CALLER"
  return_behavior     = "IMMUTABLE"
  statement           = <<EOT
try {
  var today = new Date();
  var yesterday = new Date(today);
  yesterday.setDate(today.getDate() - 1);

  // Format the date as YYYY-MM-DD
  var formatDate = (date) => date.toISOString().split('T')[0];

  var failedTables = [];

  // Ensure the single results table exists with a date column
  var ensureTableState = snowflake.createStatement({
    sqlText: `CREATE TABLE IF NOT EXISTS DEV.DBT_TESTS.FAILED_TABLES (tableName STRING, rowCount NUMBER, script STRING, failureDate DATE);`
  });
  ensureTableState.execute();

  // Find failed tables and insert into the results table with todays date
  var state1 = snowflake.createStatement({
    sqlText: "SHOW TABLES IN SCHEMA DEV.DBT_TESTS;"
  });

  var tables = state1.execute();
  while (tables.next()) {
    var tableName = tables.getColumnValue(2);
    var rowCount = tables.getColumnValue("rows");
    if (rowCount > 0) {
      var script = "SELECT * FROM " + tables.getColumnValue(3) + ".DBT_TESTS." + tableName;
      failedTables.push({
        tableName: tableName,
        rowCount: rowCount,
        script: script
      });

      // Insert into the single failed table with todays date
      var insertState = snowflake.createStatement({
        sqlText: `INSERT INTO DEV.DBT_TESTS.FAILED_TABLES VALUES(:1, :2, :3, :4);`,
        binds: [tableName, rowCount, script, formatDate(today)]
      });
      insertState.execute();
    }
  }

  // Find new failures by comparing records inserted today with those inserted yesterday
  var newFailuresState = snowflake.createStatement({
    sqlText: `SELECT tableName FROM DEV.DBT_TESTS.FAILED_TABLES WHERE failureDate = :1
              EXCEPT
              SELECT tableName FROM DEV.DBT_TESTS.FAILED_TABLES WHERE failureDate = :2;`,
    binds: [formatDate(today), formatDate(yesterday)]
  });
  var newFailures = newFailuresState.execute();
  var newFailedTables = [];
  while (newFailures.next()) {
    newFailedTables.push(newFailures.getColumnValue(1)); // Assuming the first column is tableName
  }

  // Adjust the email content to include only the new failed tables
  if (newFailedTables.length > 0) {
    var emailContent = "Alert: New data found in DBT_TESTS tables today ("+formatDate(today)+"):\n\n";

    newFailedTables.forEach(tableName => {
      emailContent += "Table: " + tableName + "\n\n";
    });

    emailContent += "Number of stale errors currently existing: " + failedTables.length;

    var state2 = snowflake.createStatement({
      sqlText: `CALL SYSTEM$SEND_EMAIL('"dev_qa_dbt_test_failures"', '${var.dev_qa_alerts_email}', 'DEV dbt Testing Failures', :1);`,
      binds: [emailContent]
    });
    state2.execute();
    return "Alert: New data found in DBT_TESTS. Check email for details.";
  }
  else {
    var emailContent2 = "No new failures found. Stale error count: " + failedTables.length;
    var state3 = snowflake.createStatement({
      sqlText: `CALL SYSTEM$SEND_EMAIL('"dev_qa_dbt_test_failures"', '${var.dev_qa_alerts_email}', 'DEV dbt Testing Success', :1);`,
      binds: [emailContent2]
    });
    state3.execute();
    return "No new failures found";
  }
} catch (e) {
  console.error("Error occurred while checking DBT test data:", e);
  return "Error checking DBT test data: " + e.message;
}
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
        var emailContent = "Alert: Data found in the following tables:\n Documentation for common errors: https://ivyrehab.atlassian.net/wiki/spaces/KB/pages/36995108/Understanding+Snowflake+Alerts \n";

        for (var i = 0; i < failedTables.length; i++) {
            var tableInfo = failedTables[i];
            emailContent += "Table: " + tableInfo.tableName + ",\n Batch Number: " + tableInfo.batchNumber + ",\n Fail Date: " + tableInfo.failDate + ",\n Fail Area: " + tableInfo.failArea + ",\n Error: " + tableInfo.error + "\n\n";
        }

        // Add the advice to truncate the table after fixing or acknowledging errors
        emailContent += "Please truncate the table after fixing or acknowledging errors.";

        // Send an alert using the notification integration
        var state2 = snowflake.createStatement({
            sqlText: `CALL SYSTEM$SEND_EMAIL('"raintree_ingestion_failures"', '${var.alerts_email}', 'Ingestion Failures', :1);`,
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
        AUTO_ID number identity start 1 increment 1,
        BATCH_ID number,
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
        BATCH_ID,
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
        $${BATCH_NUMBER} AS BATCH_ID,
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
        AUTO_ID,
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

            var alertingResult = `CALL CHECK_RAINTREE_INGESTION_LOG_AND_ALERT()`;
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

            var callProcedureSQL = `CALL INFER_SCHEMA_AND_COPY_DATA('$${BATCH_ID}', '$${tableName}', '$${RE_RUN}', false);`;
    
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
        
    } else {
        // Table does not exist, create it
        var createTableQuery = `CREATE TABLE $${tableName} (fail_date DATE, batchNumber VARCHAR, tableName VARCHAR, failArea VARCHAR, error VARCHAR)`;
        snowflake.execute({sqlText: createTableQuery});

        // Insert data into the newly created table
        var insertQuery = `INSERT INTO $${tableName} (fail_date, batchNumber, tableName, failArea, error) VALUES (CURRENT_DATE(), :1, :2, :3, :4)`;
        snowflake.execute({sqlText: insertQuery, binds: [BATCH_NUMBER, TABLE_NAME, FAIL_AREA, ERROR]});
    }
    // Check for specific error message in the ingestion fail log
    var errorCheckQuery = `SELECT COUNT(*) AS ERROR_COUNT FROM $${tableName} WHERE error LIKE '%Schema evolution is incomplete%'`;
    var errorCheckResult = snowflake.execute({sqlText: errorCheckQuery});
    
    if (errorCheckResult.next() && errorCheckResult.getColumnValue('ERROR_COUNT') > 0) {
        var updateBeforeErrorQuery = `UPDATE $${tableName} SET error = 'Schema Retry In Progress' WHERE error LIKE '%Schema evolution is incomplete%' and batchNumber = '$${BATCH_NUMBER}' and tableName = '$${TABLE_NAME}'`;
        snowflake.execute({sqlText: updateBeforeErrorQuery});

        // Call the schema evolution function for each row with the specific error
        var schemaEvolutionQuery = `CALL INFER_SCHEMA_AND_COPY_DATA(:1, :2, true, false)`;
        snowflake.execute({sqlText: schemaEvolutionQuery, binds: [BATCH_NUMBER, TABLE_NAME]});
        
        // Update the error value accordingly
        var updateErrorQuery = `UPDATE $${tableName} SET error = 'Schema Evolution Retry Successful' WHERE error LIKE '%Schema Retry In Progress%' and batchNumber = '$${BATCH_NUMBER}' and tableName = '$${TABLE_NAME}'`;
        snowflake.execute({sqlText: updateErrorQuery});
        
        return 'Schema Evolution Retry Successful';
    } else {
        return 'No rows with the specific error found.';
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

  arguments {
    name = "SCHEMA_RETRY"
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
                var callFailLogSQL = `CALL INSERT_INGESTION_FAIL_LOG('$${BATCH_ID}','Failure to insert data to table', '$${INCREMENT_TABLE_NAME}','$${err}')`;
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
                var callFailLogSQL = `CALL INSERT_INGESTION_FAIL_LOG('$${BATCH_ID}','Failure to insert data to table', '$${INCREMENT_TABLE_NAME}','$${err}')`;
                var logFail = snowflake.execute({ sqlText: callFailLogSQL });
            }
           dataInsertedCounter++; 
           tableCreatedCounter++;
        }
        
    return tableCreatedCounter;    
  } catch (err) {
    var errString = String(err);
    var errWithoutQuotes = errString.split("'").join('');
    var callFailLogSQL = `CALL INSERT_INGESTION_FAIL_LOG('$${BATCH_ID}','Failure when running infer_schema_and_copy_data', '$${INCREMENT_TABLE_NAME}','$${errWithoutQuotes}')`;
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

resource "snowflake_procedure" "create_batch_process_results_table" {
  name     = "CREATE_BATCH_PROCESS_RESULTS_TABLE"
  database = var.landing
  schema   = "RAINTREE"
  language = "JAVASCRIPT"


  return_type         = "VARCHAR(16777216)"
  execute_as          = "CALLER"
  return_behavior     = "IMMUTABLE"
  statement           = <<EOF
  try {
        // Create Batch_Process_Results table if it doesn't exist
      var createTableQuery = `
          CREATE TABLE IF NOT EXISTS Testing_Batch_Process_Results (
              Table_Name VARCHAR,
              Batch_Number VARCHAR,
              no_of_files_match BOOLEAN,
              no_of_row_count_match BOOLEAN,
              all_file_names_match BOOLEAN
          )
      `;
      var createTableStmt = snowflake.createStatement({ sqlText: createTableQuery });
      createTableStmt.execute();
      
      // Get the largest batch number from execution_audit
      var getMaxBatchExecutionAuditQuery = "SELECT COALESCE(MAX(CAST(Batch_Number AS NUMBER)), 0) FROM execution_audit";
      var getMaxBatchExecutionAuditStmt = snowflake.createStatement({ sqlText: getMaxBatchExecutionAuditQuery });
      var getMaxBatchExecutionAuditResult = getMaxBatchExecutionAuditStmt.execute();
      var largestBatchLimit = getMaxBatchExecutionAuditResult.next() ? getMaxBatchExecutionAuditResult.getColumnValue(1) : 0;

      // Get the largest batch number from Batch_Process_Results
      var getMaxBatchProcessResultsQuery = "SELECT COALESCE(MAX(CAST(Batch_Number AS NUMBER)), 0) FROM Testing_Batch_Process_Results";
      var getMaxBatchProcessResultsStmt = snowflake.createStatement({ sqlText: getMaxBatchProcessResultsQuery });
      var getMaxBatchProcessResultsResult = getMaxBatchProcessResultsStmt.execute();
      var startingBatch = getMaxBatchProcessResultsResult.next() ? getMaxBatchProcessResultsResult.getColumnValue(1) : 0;

   
    // Loop from startingBatch to largestBatchLimit and return each number in a list
    var batchNumbersList = [];
    for (var batchNum = startingBatch + 1; batchNum <= largestBatchLimit; batchNum++) {
        // Perform operations for each batch number
        var getStageFilesSQL = `LIST @SNOWFLAKE_RAINTREE_STAGE PATTERN='.*incremental\/$${batchNum}\/*.*\.parquet'`;
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

        for (var i = 0; i < processedTables.length; i++) {
            var tableName = processedTables[i];
            try{
            var upperTableName = tableName.toUpperCase();}
            catch(err){
            return 'uppercase'
            }



            //Get count of raintree_copy_history
            var countSourceTableQuery = `
            SELECT COUNT(*) 
            FROM landing.raintree.raintree_copy_history 
            WHERE BATCH_ID = $${batchNum} 
                AND TABLE_NAME = '$${upperTableName}'`;
            var countSourceTableStmt = snowflake.createStatement({ sqlText: countSourceTableQuery });
            try{

            var countSourceTableResult = countSourceTableStmt.execute();}
            catch(err){
            return 'raintree_copy_history '+ err
            }
            var countSourceTable = countSourceTableResult.next() ? countSourceTableResult.getColumnValue(1) : 0;

            var listCommand = `ls @SNOWFLAKE_RAINTREE_STAGE PATTERN='.*incremental\/$${batchNum}\/$${tableName}\/.*\.parquet';`;
            try{
            snowflake.execute({ sqlText: listCommand});}
            catch(err){
                return 'list broke'
            }
            
            var countStagedFilesQuery = `
            SELECT COUNT(*) 
            FROM TABLE(RESULT_SCAN(LAST_QUERY_ID()))
            `;
            var countStagedFilesStmt = snowflake.createStatement({ sqlText: countStagedFilesQuery });
            var countStagedFilesResult = countStagedFilesStmt.execute();
            var countStagedFiles = countStagedFilesResult.next() ? countStagedFilesResult.getColumnValue(1) : 0;
    
            //BEGINNING OF ROW COUNT MATCH
             // Get sum of ROW_COUNT from raintree_copy_history
            var getRowCountHistoryQuery = `
                SELECT SUM(ROW_COUNT) AS total_rows
                FROM landing.raintree.raintree_copy_history 
                WHERE BATCH_ID = $${batchNum}
                    AND TABLE_NAME = '$${upperTableName}'
            `;
            var rowCountHistoryStmt = snowflake.createStatement({ sqlText: getRowCountHistoryQuery });
            var rowCountHistoryResult = rowCountHistoryStmt.execute();
            var rowCountHistory = rowCountHistoryResult.next() ? rowCountHistoryResult.getColumnValue(1) : 0;
        
            // Get row count from equivalent table in the database
            var getRowCountDatabaseQuery = `
                SELECT COUNT(*) AS row_count
                FROM $${upperTableName}
                WHERE BATCH_ID = $${batchNum};
            `;
            var rowCountDatabaseStmt = snowflake.createStatement({ sqlText: getRowCountDatabaseQuery });
            var rowCountDatabaseResult = rowCountDatabaseStmt.execute();
            var rowCountDatabase = rowCountDatabaseResult.next() ? rowCountDatabaseResult.getColumnValue(1) : 0;
            

            rowCountHistory = rowCountHistory === null ? 0 : rowCountHistory;
            rowCountDatabase = rowCountDatabase === null ? 0 : rowCountDatabase;

            // Compare row counts
            var rowCountMatch = rowCountHistory === rowCountDatabase;



            //BEGINNING OF ALL FILE_NAMES_MATCH
            var getHistoryFilesQuery = `
                SELECT stage_location || file_name AS history_file
                FROM landing.raintree.raintree_copy_history 
                WHERE BATCH_ID = $${batchNum}
                    AND TABLE_NAME = '$${upperTableName}'
            `;
            var historyFilesStmt = snowflake.createStatement({ sqlText: getHistoryFilesQuery });
            var historyFilesResult = historyFilesStmt.execute();
            
            // Array to store history files
            var historyFiles = [];
            
            while (historyFilesResult.next()) {
                historyFiles.push(historyFilesResult.getColumnValue('HISTORY_FILE'));
            }
            
            var listCommand = `ls @SNOWFLAKE_RAINTREE_STAGE PATTERN='.*incremental\/$${batchNum}\/$${tableName}\/.*\.parquet';`;
            try{
            snowflake.execute({ sqlText: listCommand});}
            catch(err){
                return 'list broke'
            }

            var getStageFilesQuery = `
                SELECT *
            FROM TABLE(RESULT_SCAN(LAST_QUERY_ID()))
            `;
            var stageFilesStmt = snowflake.createStatement({ sqlText: getStageFilesQuery });
            var stageFilesResult = stageFilesStmt.execute();
            
            // Array to store stage files
            var stageFiles = [];
            
            while (stageFilesResult.next()) {
                stageFiles.push(stageFilesResult.getColumnValue('name'));
            }


            var filesMatch = JSON.stringify(historyFiles.sort()) === JSON.stringify(stageFiles.sort());
    

            // Insert the processed table and batch number into Batch_Process_Results
            var insertIntoResultsQuery = `
                INSERT INTO Testing_Batch_Process_Results (Table_Name, Batch_Number,no_of_files_match, no_of_row_count_match, all_file_names_match)
                VALUES ('$${tableName}', '$${batchNum}', $${countSourceTable === countStagedFiles} , $${rowCountMatch} , $${filesMatch})
            `;
            var insertIntoResultsStmt = snowflake.createStatement({ sqlText: insertIntoResultsQuery });
            try{
            insertIntoResultsStmt.execute();}
            catch(err){
            return 'insert broke ' + err
            }
        }
    }
        // Select rows where no_of_files_match = false or no_of_row_count_match = false or all_file_names_match = false
        var selectMismatchedRowsQuery = `
            SELECT *
            FROM Testing_Batch_Process_Results
            WHERE no_of_files_match = FALSE OR no_of_row_count_match = FALSE OR all_file_names_match = FALSE
        `;
        var selectMismatchedRowsStmt = snowflake.createStatement({ sqlText: selectMismatchedRowsQuery });
        var selectMismatchedRowsResult = selectMismatchedRowsStmt.execute();

        // Initialize array to store information about mismatched rows
        var mismatchedRows = [];

        // Loop through mismatched rows and add each row to the array
        while (selectMismatchedRowsResult.next()) {
            var tableName = selectMismatchedRowsResult.getColumnValue(1);
            var batchNumber = selectMismatchedRowsResult.getColumnValue(2);
            var noOfFileMatch = selectMismatchedRowsResult.getColumnValue(3);
            var noOfRowCountMatch = selectMismatchedRowsResult.getColumnValue(4);
            var allFileNamesMatch = selectMismatchedRowsResult.getColumnValue(5);

            // Add the row information to the array
            mismatchedRows.push({
                tableName: tableName,
                batchNumber: batchNumber,
                noOfFileMatch: noOfFileMatch,
                noOfRowCountMatch: noOfRowCountMatch,
                allFileNamesMatch: allFileNamesMatch
            });
        }

        // Check if there are mismatched rows
        if (mismatchedRows.length > 0) {
            // Initialize variables for email content
            var emailSubject = "Raintree Stage to Landing Failure";
            var emailRecipient = "${var.alerts_email}";
            var emailContent = "The following tables need to be investigated as to why they failed their category:\n\n";

            // Loop through mismatched rows and append information to email content
            for (var i = 0; i < mismatchedRows.length; i++) {
                var rowInfo = mismatchedRows[i];
                emailContent += "Table: " + rowInfo.tableName + ", Batch Number: " + rowInfo.batchNumber + "\n";
                emailContent += "Number of Files Match: " + rowInfo.noOfFileMatch + ",\n Row Count Match: " + rowInfo.noOfRowCountMatch + ",\n All File Names Match: " + rowInfo.allFileNamesMatch + "\n\n";
            }

            // Add advice to truncate the table after fixing or acknowledging errors
            emailContent += "Please investigate and update values once fixed.";

            // Send email with the collected information
            var emailQuery = `
                CALL SYSTEM$SEND_EMAIL('"raintree_ingestion_failures"','$${emailRecipient}','$${emailSubject}',:1);
            `;
            var emailStmt = snowflake.createStatement({ sqlText: emailQuery, binds: [emailContent] });
            var emailResult = emailStmt.execute();
        }



     return "Batch_Process_Results table created or already exists.";
} catch (err) {
    return "Error: " + err.message;
}
EOF
}

resource "snowflake_procedure" "create_loading_process_results_table" {
  name     = "CREATE_LOADING_PROCESS_RESULTS_TABLE"
  database = var.landing
  schema   = var.foto_schema
  language = "JAVASCRIPT"


  return_type         = "VARCHAR(16777216)"
  execute_as          = "CALLER"
  return_behavior     = "IMMUTABLE"
  statement           = <<EOF
  try {
        // Create Loding_Process_Results table if it doesn''t exist
      var createTableQuery = `
          CREATE TABLE IF NOT EXISTS Testing_foto_Loading_Process_Results (
              table_name VARCHAR,
              table_modified_date TIMESTAMP,
              is_row_count_match BOOLEAN,
              is_folder_name_match BOOLEAN, 
              created_at DATE
          )
      `;
      var createTableStmt = snowflake.createStatement({ sqlText: createTableQuery });
      createTableStmt.execute();

     // Perform operations for each batch number
        var getStageFilesSQL = `LIST @SNOWFLAKE_FOTO_STAGE/NetHealth/ PATTERN='.*\\.parquet'`;
        var fileListResultSet = snowflake.execute({ sqlText: getStageFilesSQL });

     // Declare an array to store all file names
        var allFileNames = [];

     // Loop through the result set and extract all file names
        while (fileListResultSet.next()) {
            var fileName = fileListResultSet.getColumnValue(1);
            allFileNames.push(fileName);
        }
    
     // Get most Recent Folder name from ExternalStage
        var mostRecentFolder = findLatestFolder(allFileNames);   

     // Get most recent files from folder:
        var mostRecentFiles = allFileNames.filter(file => file.includes('/' + mostRecentFolder +'/'));
        var processedTables = [];

     // Iterate through the filtered mostRecentFiles array
        for (var i = 0; i < mostRecentFiles.length; i++) {
            var fullFileName = mostRecentFiles[i];

            // Extract last segment of the path
            var lastSegment = fullFileName.split('/').pop();
            // Extract the table name
            var tableName = lastSegment.split('.')[0];

            // Check if the table has already been processed
            if (processedTables.includes(tableName)) {
                // Skip processing if the table has been processed before
                continue;
            }

            // Add the current table to the list of processed tables
            processedTables.push(tableName);
        }

        for (var i = 0; i < processedTables.length; i++) {
            var tableName = processedTables[i];
            try{
                var upperTableName = tableName.toUpperCase();}
                catch(err){
                return 'uppercase'
            }

    
            //BEGINNING OF ROW COUNT MATCH
            var getRowCountQuery = `
                SELECT COUNT(*) AS table_row_count
                FROM foto.$${upperTableName}
            `;
            var rowCountStmt = snowflake.createStatement({ sqlText: getRowCountQuery });
            var rowCountResult = rowCountStmt.execute();
            var rowCount = rowCountResult.next() ? rowCountResult.getColumnValue(1) : 0;
        
            // Get row count from equivalent table from information_schema
            var getRowCountDatabaseQuery = `
                SELECT ROW_COUNT as external_stage_row_count, FILE_NAME, LAST_LOAD_TIME
                FROM LANDING.INFORMATION_SCHEMA.LOAD_HISTORY
                WHERE SCHEMA_NAME = 'FOTO' AND TABLE_NAME = 'Z_$${upperTableName}'
                ORDER BY LAST_LOAD_TIME DESC
                LIMIT 1;
            `;
            var rowCountLoadHistoryStmt = snowflake.createStatement({ sqlText: getRowCountDatabaseQuery });
            var rowCountLoadHistoryResult = rowCountLoadHistoryStmt.execute();
            if (rowCountLoadHistoryResult.next()) {
                var rowCountLoadHistory = rowCountLoadHistoryResult.getColumnValue(1);
                var folderPathLoadHistory = rowCountLoadHistoryResult.getColumnValue(2) ;
                var tableModifiedDate = rowCountLoadHistoryResult.getColumnValue(3);
            }
            else
            {
                var rowCountLoadHistory = 0;
                var folderPathLoadHistory  = 0;
                var tableModifiedDate = 0;
            }
   
            rowCount = rowCount === null ? 0 : rowCount;
            folderPathLoadHistory = folderPathLoadHistory === null ? 0 : folderPathLoadHistory;
            rowCountLoadHistory = rowCountLoadHistory === null ? 0 : rowCountLoadHistory;

            
            var pathSegmentsLoadHistory = folderPathLoadHistory.split('/');
            var folderNameLoadHistory = pathSegmentsLoadHistory[pathSegmentsLoadHistory.length - 2];
                
            // Compare row counts
            var rowCountMatch = rowCount === rowCountLoadHistory;

            // Compare if copied the folder is the most recent folder from External stage
            var folderNameMatch = mostRecentFolder === folderNameLoadHistory
            var dateObject = new Date(tableModifiedDate);
            var isoDateString = dateObject.toISOString();
            
            // Insert the processed table and batch number into Batch_Process_Results
            var insertIntoResultsQuery = `
                INSERT INTO Testing_foto_Loading_Process_Results (Table_Name, Table_Modified_Date, is_row_count_match, is_folder_name_match, created_at)
                VALUES ('$${upperTableName}', '$${isoDateString}', $${rowCountMatch} , $${folderNameMatch}, CURRENT_DATE())
            `;
            
            var insertIntoResultsStmt = snowflake.createStatement({ sqlText: insertIntoResultsQuery });
            try{
                insertIntoResultsStmt.execute();}
                catch(err){
                return 'insert broke ' + err
                }
            }
        
        // Select rows where is_row_count_match = false or is_folder_name_match = false
        var selectMismatchedRowsQuery = `
            SELECT *
            FROM Testing_foto_Loading_Process_Results
            WHERE is_row_count_match = FALSE or is_folder_name_match = FALSE and DATE(created_at) = CURRENT_DATE()
        `;
        var selectMismatchedRowsStmt = snowflake.createStatement({ sqlText: selectMismatchedRowsQuery });
        var selectMismatchedRowsResult = selectMismatchedRowsStmt.execute();

        // Initialize array to store information about mismatched rows
        var mismatchedRows = [];

        // Loop through mismatched rows and add each row to the array
        while (selectMismatchedRowsResult.next()) {
            try{
                var tableName = selectMismatchedRowsResult.getColumnValue(1);
                var tableModifiedDate = selectMismatchedRowsResult.getColumnValue(2);
                var isRowCountMatch = selectMismatchedRowsResult.getColumnValue(3);
                var isFolderNameMatch = selectMismatchedRowsResult.getColumnValue(4);
                var createdAt = selectMismatchedRowsResult.getColumnValue(5)
                
                // Add the row information to the array
                mismatchedRows.push({
                    tableName: tableName,
                    tableModifiedDate: tableModifiedDate,
                    isRowCountMatch: isRowCountMatch,
                    isFolderNameMatch: isFolderNameMatch,
                    createdAt: createdAt
                });
                } catch(error){
                    console.error("Error processing row:", error);
                }
        }

    // Check if there are mismatched rows
        if (mismatchedRows.length > 0) {
            // Initialize variables for email content
            var curentDate = mismatchedRows[0].createdAt.toISOString().split('T')[0];
            var emailSubject = "Error occures in FOTO Stage to Landing as of " + curentDate;
            var emailRecipient = "d5924730.ivyrehab.onmicrosoft.com@amer.teams.ms";
            var emailContent = "The following tables need to be investigated as to why they failed their category:\\n\\n";

            // Loop through mismatched rows and append information to email content
            for (var i = 0; i < mismatchedRows.length; i++) {
                var rowInfo = mismatchedRows[i];
                emailContent += "Table: " + rowInfo.tableName + "\\n";
                emailContent += "Row Count Match: " + rowInfo.isRowCountMatch + "\\n";
                emailContent += "Most recent files loaded: " + rowInfo.isFolderNameMatch + "\\n\\n";
            }

            // Add advice to truncate the table after fixing or acknowledging errors
            emailContent += "Please investigate and update values once fixed.";

            // Send email with the collected information
            var emailQuery = `
                CALL SYSTEM$SEND_EMAIL('"foto_ingestion_failures"','$${emailRecipient}','$${emailSubject}',:1);
            `;
            var emailStmt = snowflake.createStatement({ sqlText: emailQuery, binds: [emailContent] });
            var emailResult = emailStmt.execute();
        }

     return "Mismatched rows or misamatched file names: " + mismatchedRows.length;
} catch (err) {
    return "Error: " + err.message;
}

function findLatestFolder(files) {
    var largestFolderNumber = -1;
    var mostRecentFolder = null;

    files.forEach(file => {
        var pathSegments = file.split('/');
        var folder = pathSegments[pathSegments.length - 2]
        var dateString = folder.split('_')[1];
        var dateInteger = parseInt(dateString,10);
        
        if (dateInteger > largestFolderNumber) {
            largestFolderNumber = dateInteger;
            mostRecentFolder = "IvyRehab_"+ largestFolderNumber;
        }
    });

    return mostRecentFolder;
}
EOF
}

resource "snowflake_procedure" "create_batch_process_results_table_given_batch" {
  name     = "CREATE_BATCH_PROCESS_RESULTS_TABLE_GIVEN_BATCH"
  database = var.landing
  schema   = "RAINTREE"
  language = "JAVASCRIPT"

  arguments {
    name = "BATCH_NUMBER"
    type = "varchar"
  }

  return_type         = "VARCHAR(16777216)"
  execute_as          = "CALLER"
  return_behavior     = "IMMUTABLE"
  statement           = <<EOF

  try {
   
    // Loop from startingBatch to largestBatchLimit and return each number in a list
    var batchNumbersList = [];
    var batch_number_convert = parseInt(BATCH_NUMBER);
    for (var batchNum = batch_number_convert; batchNum <= batch_number_convert; batchNum++) {
        // Perform operations for each batch number
        var getStageFilesSQL = `LIST @SNOWFLAKE_RAINTREE_STAGE PATTERN='.*incremental\/$${batchNum}\/*.*\.parquet'`;
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

        for (var i = 0; i < processedTables.length; i++) {
            var tableName = processedTables[i];
            try{
            var upperTableName = tableName.toUpperCase();}
            catch(err){
            return 'uppercase'
            }



            //Get count of raintree_copy_history
            var countSourceTableQuery = `
            SELECT COUNT(*) 
            FROM landing.raintree.raintree_copy_history 
            WHERE BATCH_ID = $${batchNum} 
                AND TABLE_NAME = '$${upperTableName}'`;
            var countSourceTableStmt = snowflake.createStatement({ sqlText: countSourceTableQuery });
            try{

            var countSourceTableResult = countSourceTableStmt.execute();}
            catch(err){
            return 'raintree_copy_history '+ err
            }
            var countSourceTable = countSourceTableResult.next() ? countSourceTableResult.getColumnValue(1) : 0;

            var listCommand = `ls @SNOWFLAKE_RAINTREE_STAGE PATTERN='.*incremental\/$${batchNum}\/$${tableName}\/.*\.parquet';`;
            try{
            snowflake.execute({ sqlText: listCommand});}
            catch(err){
                return 'list broke'
            }
            
            var countStagedFilesQuery = `
            SELECT COUNT(*) 
            FROM TABLE(RESULT_SCAN(LAST_QUERY_ID()))
            `;
            var countStagedFilesStmt = snowflake.createStatement({ sqlText: countStagedFilesQuery });
            var countStagedFilesResult = countStagedFilesStmt.execute();
            var countStagedFiles = countStagedFilesResult.next() ? countStagedFilesResult.getColumnValue(1) : 0;
    
            //BEGINNING OF ROW COUNT MATCH
             // Get sum of ROW_COUNT from raintree_copy_history
            var getRowCountHistoryQuery = `
                SELECT SUM(ROW_COUNT) AS total_rows
                FROM landing.raintree.raintree_copy_history 
                WHERE BATCH_ID = $${batchNum}
                    AND TABLE_NAME = '$${upperTableName}'
            `;
            var rowCountHistoryStmt = snowflake.createStatement({ sqlText: getRowCountHistoryQuery });
            var rowCountHistoryResult = rowCountHistoryStmt.execute();
            var rowCountHistory = rowCountHistoryResult.next() ? rowCountHistoryResult.getColumnValue(1) : 0;
        
            // Get row count from equivalent table in the database
            var getRowCountDatabaseQuery = `
                SELECT COUNT(*) AS row_count
                FROM $${upperTableName}
                WHERE BATCH_ID = $${batchNum};
            `;
            var rowCountDatabaseStmt = snowflake.createStatement({ sqlText: getRowCountDatabaseQuery });
            var rowCountDatabaseResult = rowCountDatabaseStmt.execute();
            var rowCountDatabase = rowCountDatabaseResult.next() ? rowCountDatabaseResult.getColumnValue(1) : 0;
            

            rowCountHistory = rowCountHistory === null ? 0 : rowCountHistory;
            rowCountDatabase = rowCountDatabase === null ? 0 : rowCountDatabase;

            // Compare row counts
            var rowCountMatch = rowCountHistory === rowCountDatabase;



            //BEGINNING OF ALL FILE_NAMES_MATCH
            var getHistoryFilesQuery = `
                SELECT stage_location || file_name AS history_file
                FROM landing.raintree.raintree_copy_history 
                WHERE BATCH_ID = $${batchNum}
                    AND TABLE_NAME = '$${upperTableName}'
            `;
            var historyFilesStmt = snowflake.createStatement({ sqlText: getHistoryFilesQuery });
            var historyFilesResult = historyFilesStmt.execute();
            
            // Array to store history files
            var historyFiles = [];
            
            while (historyFilesResult.next()) {
                historyFiles.push(historyFilesResult.getColumnValue('HISTORY_FILE'));
            }
            
            var listCommand = `ls @SNOWFLAKE_RAINTREE_STAGE PATTERN='.*incremental\/$${batchNum}\/$${tableName}\/.*\.parquet';`;
            try{
            snowflake.execute({ sqlText: listCommand});}
            catch(err){
                return 'list broke'
            }

            var getStageFilesQuery = `
                SELECT *
            FROM TABLE(RESULT_SCAN(LAST_QUERY_ID()))
            `;
            var stageFilesStmt = snowflake.createStatement({ sqlText: getStageFilesQuery });
            var stageFilesResult = stageFilesStmt.execute();
            
            // Array to store stage files
            var stageFiles = [];
            
            while (stageFilesResult.next()) {
                stageFiles.push(stageFilesResult.getColumnValue('name'));
            }


            var filesMatch = JSON.stringify(historyFiles.sort()) === JSON.stringify(stageFiles.sort());
    

             // Insert the processed table and batch number into Batch_Process_Results
            var insertIntoResultsQuery = `
                INSERT INTO Testing_Batch_Process_Results (Table_Name, Batch_Number,no_of_files_match, no_of_row_count_match, all_file_names_match)
                VALUES ('$${tableName}', '$${batchNum}', $${countSourceTable === countStagedFiles} , $${rowCountMatch} , $${filesMatch})
            `;
            var insertIntoResultsStmt = snowflake.createStatement({ sqlText: insertIntoResultsQuery });
            try{
            insertIntoResultsStmt.execute();
            }
            catch(err){
               return 'insert broke' + err
            }
       }
    }



     return "Batch_Process_Results table created or already exists.";
} catch (err) {
    return "Error: " + err.message;
}
  
EOF
}

resource "snowflake_procedure" "create_cost_center_alert" {
  name     = "COST_CENTER_ALERT"
  database = var.prod
  schema   = "WAREHOUSE"
  language = "JAVASCRIPT"
  return_type         = "VARCHAR(16777216)"
  execute_as          = "CALLER"
  return_behavior     = "IMMUTABLE"
  comment = "Read the cost_center_alert_view and send a notification if there is record(s) in the view."
  statement           = <<EOF

  try {
   
  var result = "";
 
  var sqlStatement = snowflake.createStatement({
    sqlText: "SELECT * FROM PROD.WAREHOUSE.COST_CENTER_ALERT ORDER BY POTENTIAL_RAINTREE_LOCATION_CODE;"
  });
 
  var mismatches = sqlStatement.execute();
  var msg = `<html><head><style>
          table {
            border-collapse: collapse;
            width: 100%;
          }
          th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: center;
          }
       </style></head><body><table border="1" style="background-color: #D6EEEE"><tr><th>ADAPTIVE_COST_CENTER_CODE</th><th>ADAPTIVE_CLINIC_NAME</th><th>RAINTREE_COST_CENTER_CODE</th><th>POTENTIAL_RAINTREE_LOCATION_CODE</th></tr>`;
  
  while (mismatches.next()) {
    var ADAPTIVE_COST_CENTER_CODE = mismatches.getColumnValue(1);
    var ADAPTIVE_CLINIC_NAME = mismatches.getColumnValue(2);
    var RAINTREE_COST_CENTER_CODE = mismatches.getColumnValue(3);
    var POTENTIAL_RAINTREE_LOCATION_CODE = mismatches.getColumnValue(4);  
    
    msg += '<tr :hover {background-color: coral;}><td>' + ADAPTIVE_COST_CENTER_CODE + '</td><td>' + ADAPTIVE_CLINIC_NAME + '</td><td>' + RAINTREE_COST_CENTER_CODE + '</td><td>' + POTENTIAL_RAINTREE_LOCATION_CODE + '</td></tr>';
    }
    msg += `</table></body></html>`; 
     
    // Send an alert using the notification integration
    var state2 = snowflake.createStatement({
        sqlText: `CALL SYSTEM$SEND_EMAIL('"cost_center_alert"', '${var.cost_center_alerts_email}', 'Cost Center Mismatches', :1,'text/html');`,
        binds: [msg]
    });
    var alertResult = state2.execute();
    
    result = "Alert: Data found in COST_CENTER_ALERT. Check email for details.";
} catch (e) {
  // Handle any errors that occur during the execution of the procedure
  console.error("Error occurred while checking COST_CENTER_ALERT data:", e);
  result = "Error checking COST_CENTER_ALERT data: " + e.message;
}

  return result;
EOF
}