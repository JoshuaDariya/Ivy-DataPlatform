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
  return_type         = "number"
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
  comment             = "Copy data from staging table to source, will rollback on error."
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