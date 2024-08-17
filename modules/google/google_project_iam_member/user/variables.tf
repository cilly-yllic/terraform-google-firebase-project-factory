variable "project" {
  type = string
}

variable "role" {
  type    = string # roles/viewer | roles/editor | roles/owner
  default = "roles/viewer"
}

variable "member" {
  type = string
}

variable "deploy" {
  type    = bool
  default = false
}
