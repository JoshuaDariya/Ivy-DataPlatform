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

  default = ["LANDING","DEV","STAGE","PROD"]
}