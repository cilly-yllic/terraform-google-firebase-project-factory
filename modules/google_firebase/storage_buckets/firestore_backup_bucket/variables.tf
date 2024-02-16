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
  type = string
  validation {
    condition     = contains(["cloud_functions", "cloud_run"], var.export_platform)
    error_message = "Invalid platform name, export_platform can be cloud_functions or cloud_run."
  }
}