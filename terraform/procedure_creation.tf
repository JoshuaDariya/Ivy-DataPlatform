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
  execute_as          = "caller"
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
  execute_as          = "caller"
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
  execute_as          = "caller"
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
    var emailContent = "Alert: Data found in the following DBT_TESTS tables:\\n\\n";
 
    for (var i = 0; i < failedTables.length; i++) {
      var tableInfo = failedTables[i];
      emailContent += `Table: ' + tableInfo.tableName +', Row Count: '+ tableInfo.rowCount + '\\nScript: '+ tableInfo.script + '\\n\\n`;
    }
 
    // Send an alert using the notification integration
    var state2 = snowflake.createStatement({
      sqlText: "CALL SYSTEM$SEND_EMAIL(''dbt_test_failures'', ''alex.crosslen@parivedasolutions.com'', ''dbt Testing Failures'', :1)",
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