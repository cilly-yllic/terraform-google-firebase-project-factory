variable "project" {
  type = string
}
variable "region" {
  type = string
}
variable "bucket_name" {
  type = string
}
variable "storage_class" {
  type = string
}
variable "iams" {
  type = list(object({
    role    = string
    members = list(string)
  }))
  default = []
}