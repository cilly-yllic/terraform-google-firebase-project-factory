variable "project" {
  type = string
}

variable "account_id" {
  type = string
}

variable "display_name" {
  type = string
}

variable "type" {
  type = string
}

variable "args" {
  type    = any
  default = {}
}
