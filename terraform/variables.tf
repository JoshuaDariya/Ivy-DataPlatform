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

variable "databases" {
  type = set(string)

  default = ["LANDING","DEV","QA","PROD"]
}

variable "databases_with_schema" {
  type = set(string)

  default = ["DEV","QA","PROD"]
}

variable "landing"{
  type = string

  default = "LANDING"
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

variable "ivydwstorageSASToken" {
  type = string

  default = "ivydwstorageSASToken"
}

variable "snowflakeLoginPassword" {
  type = string

  default = "snowflakeLoginPassword"
}