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

variable "rules" {
  type        = list(string)
  default     = []
  description = "additional rules"
}

variable "args" {
  type    = any
  default = {}
}
