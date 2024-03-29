variable "api_services" {
  type    = list(string)
  default = []
}

variable "editors" {
  description = "Firebase project Development member's emails."
  type        = list(string)
  default     = []
}

variable "firestore_backup_buckets" {
  description = "Backups of Firestore."
  type = list(object({
    bucket_name     = string
    export_platform = optional(string, "cloud_functions")
  }))
  default = []
  validation {
    condition = length([
      for o in var.firestore_backup_buckets : true
      if contains(["cloud_functions", "cloud_run"], o.export_platform)
    ]) == length(var.firestore_backup_buckets)
    error_message = "Invalid platform name, firestore_backup_buckets.*.export_platform can be cloud_functions or cloud_run."
  }
  nullable = false
}

variable "hosting_names" {
  description = "Firebase project Hosting names."
  type        = list(string)
  default     = []
}

variable "organization_id" {
  description = "GCP organizationId."
  type        = string
}

variable "project_id" {
  description = "Firebase project id"
  type        = string
}

variable "region" {
  description = "Firebase project region."
  type        = string
  default     = "asia-northeast1"
}

variable "storage_buckets" {
  description = "Firebase project Hosting names."
  type = list(object({
    bucket_name   = string // this to be -> {project-id}-{bucket_name}
    storage_class = optional(string, "REGIONAL")
    iams = optional(list(object({
      role    = string
      members = list(string)
      })), [{
      role    = "roles/storage.legacyObjectReader"
      members = ["allUsers"]
    }])
  }))
  default = []
}