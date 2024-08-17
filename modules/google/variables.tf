variable "project" {
  type = string
}

variable "users" {
  type = list(object({
    role   = optional(string, "viewer") # viewer | editor | owner
    email  = string
    deploy = optional(bool, false)
  }))
  default = []
}

variable "service_accounts" {
  type = list(object({
    account_id   = string
    display_name = optional(string)
    type         = string # deploy
    args         = optional(any, {})
  }))
  default = []
}
