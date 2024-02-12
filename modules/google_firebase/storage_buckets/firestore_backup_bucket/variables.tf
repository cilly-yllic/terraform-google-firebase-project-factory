variable "project" {
  type = string
}
variable "region" {
  type = string
}
variable "bucket_name" {
  type = string
}

variable "export_platform" {
  type = object({
    cloud_functions : bool // v1
    cloud_run : bool       // v2
  })
}