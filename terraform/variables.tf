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

  default = "LOADER"
}

variable "powerbi_role"{
  type = string

  default = "REPORTER"
}

variable "developer_role"{
  type = string

  default = "TRANSFORMER_DEV"
}

variable "qa_role"{
  type = string

  default = "TRANSFORMER_QA"
}

variable "prod_role"{
  type = string

  default = "TRANSFORMER_PROD"
}