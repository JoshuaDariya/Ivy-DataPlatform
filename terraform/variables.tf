variable "account" {
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}

variable "region" {
  type = string
}

variable "storage_aws_role_arn"{
  type = string
}

variable "aws_url_storage_allowed_locations"{
  type = string
}

variable "azure_foto_url_storage_allowed_locations"{
  type = string
}

variable "azure_adaptive_url_storage_allowed_locations"{
  type = string
}

variable "azure_adaptive_url_storage_allowed_locations_prod"{
  type = string
}

variable "azure_calltracking_url_storage_allowed_locations"{
  type = string
}

variable "azure_calltracking_url_storage_allowed_locations_prod"{
  type = string
}

variable "azure_tenant"{
  type = string
}

variable "databases" {
  type = set(string)

  default = ["LANDING","DEV","QA","PROD"]
}

variable "databases_with_schema" {
  type = set(string)

  default = ["DEV","QA","PROD"]
}

variable "landing_schemas_available_to_reporter" {
  type = set(string)
  default = ["\"LANDING\".\"RAINTREE\"", "\"LANDING\".\"SALESFORCE\"", "\"LANDING\".\"ADAPTIVE\"", "\"LANDING\".\"CALLTRACKING\"", "\"LANDING\".\"CLINIC_MASTER\"", "\"LANDING\".\"FOTO\"", "\"LANDING\".\"OBJECTIVES_TRACKING\"","\"LANDING\".\"RINGCENTRAL\"", "\"LANDING\".\"FIVETRAN_COSTUME_SYMPHYSIS_STAGING\"", "\"LANDING\".\"FIVETRAN_METADATA\"", "\"LANDING\".\"FIVETRAN_OFT_EFFICIENCY_STAGING\"", "\"LANDING\".\"LOCATIONS_MASTER_DATA_TEST\"", "\"LANDING\".\"PUBLIC\"", "\"LANDING\".\"GOOGLE_ADS\"","\"LANDING\".\"SOPHOS\"","\"LANDING\".\"TESTGRANTSCHEMA\""]
}

variable "landing"{
  type = string

  default = "LANDING"
}

variable "landing_dev"{
  type = string

  default = "LANDING_DEV"
}

variable "landing_qa"{
  type = string

  default = "LANDING_QA"
}

variable "dev"{
  type = string

  default = "DEV"
}

variable "qa"{
  type = string

  default = "QA"
}

variable "prod"{
  type = string

  default = "PROD"
}

variable "loader_role"{
  type = string

  default = "SNOWFLAKELOADER"
}

variable "powerbi_role"{
  type = string

  default = "SNOWFLAKEREPORTER"
}

variable "workday_payroll_role"{
  type = string

  default = "SNOWFLAKEFINANCIALREPORTER"
}


variable "developer_role"{
  type = string

  default = "SNOWFLAKEDEV"
}

variable "qa_role"{
  type = string

  default = "SNOWFLAKEQA"
}

variable "prod_role"{
  type = string

  default = "SNOWFLAKEPROD"
}

variable "tf_role"{
  type= string

  default = "TERRAFORMADMIN"
}

variable "raintree_v2_schema"{
  type = string

  default = "RAINTREE"
}

variable "raintree_s3_int"{
  type = string

  default = "S3_SNOWFLAKE_INT"
}

variable "raintree_stage"{
  type = string

  default = "SNOWFLAKE_RAINTREE_STAGE"
}

variable "foto_stage"{
  type = string

  default = "SNOWFLAKE_FOTO_STAGE"
}

variable "foto_schema"{
  type = string

  default = "FOTO"
}

variable "foto_azure_int"{
  type = string

  default = "FOTO_AZURE_SNOWFLAKE_INT"
}

variable "adaptive_stage"{
  type = string

  default = "ADAPTIVE_API_STAGE"
}

variable "adaptive_stage_prod"{
  type = string

  default = "ADAPTIVE_API_STAGE_PROD"
}

variable "adaptive_schema"{
  type = string

  default = "ADAPTIVE"
}

variable "adaptive_azure_int"{
  type = string

  default = "ADAPTIVE_AZURE_SNOWFLAKE_INT"
}

variable "adaptive_azure_int_prod"{
  type = string

  default = "ADAPTIVE_AZURE_SNOWFLAKE_INT_PROD"
}

variable "calltracking_stage"{
  type = string

  default = "CALLTRACKING_STAGE"
}

variable "calltracking_stage_prod"{
  type = string

  default = "CALLTRACKING_STAGE_PROD"
}

variable "calltracking_schema"{
  type = string

  default = "CALLTRACKING"
}

variable "calltracking_azure_int"{
  type = string

  default = "CALLTRACKING_AZURE_SNOWFLAKE_INT"
}

variable "calltracking_azure_int_prod"{
  type = string

  default = "CALLTRACKING_AZURE_SNOWFLAKE_INT_PROD"
}

variable "alerts_email"{
  type = string
}

variable "cost_center_alerts_email"{
  type = string
}

variable "dev_qa_alerts_email"{
  type = string
}