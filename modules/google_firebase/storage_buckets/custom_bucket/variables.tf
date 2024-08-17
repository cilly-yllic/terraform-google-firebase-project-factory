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
variable "soft_delete_policy" {
  type = object({
    retention_duration_seconds = number
  })
  default = { retention_duration_seconds : 0 }
}
variable "iams" {
  type = list(object({
    role    = string
    members = list(string)
  }))
  default = []
}