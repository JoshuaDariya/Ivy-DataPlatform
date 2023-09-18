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

  default = ["DEV","STAGE","PROD"]
}