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