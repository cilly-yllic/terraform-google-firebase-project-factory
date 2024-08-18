variable "api_services" {
  type    = list(string)
  default = []
}

variable "users" {
  description = "Firebase project Development member's emails."
  type = list(object({
    role   = optional(string, "viewer") # viewer | editor | owner
    email  = string
    deploy = optional(bool, false)
  }))
  default = []
  validation {
    condition = length([
      for o in var.users : true
      if contains(["viewer", "editor", "owner"], o.role)
    ]) == length(var.users)
    error_message = "Invalid role name, members.*.role can be viewer, editor or owner."
  }
}

variable "service_accounts" {
  description = "Firebase project Service Accounts list."
  type = list(object({
    account_id   = string
    display_name = optional(string)
    type         = string # deploy
    rules        = optional(list(string), [])
    args         = optional(any, {})
  }))
  default = []
  validation {
    condition = length([
      for o in var.service_accounts : true
      if o.type == "deploy" && alltrue([
        for k in ["hosting", "functions", "firestore", "storage", "scheduler"] : can(o.args[k])
      ])
    ]) == length(var.service_accounts)
    error_message = "Invalid valid service account. type must be deploy, And also args has these keys hosting, functions, firestore, storage, and scheduler"
  }
}

variable "firestore_backup_buckets" {
  description = "Backups of Firestore."
  type = list(object({
    bucket_name = string
    soft_delete_policy = optional(object({
      retention_duration_seconds = number
    }), { retention_duration_seconds : 0 })
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
    soft_delete_policy = optional(object({
      retention_duration_seconds = number
    }), { retention_duration_seconds : 0 })
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