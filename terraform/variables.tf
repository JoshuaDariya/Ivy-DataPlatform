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
  type = list(string)

  default = ["LANDING", "STAGE"]
}