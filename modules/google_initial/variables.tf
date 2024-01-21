variable "project" {
  type = string
}
variable "region" {
  type = string
}

variable "api_services" {
  type    = list(string)
  default = []
}