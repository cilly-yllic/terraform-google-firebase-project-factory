locals {
  organization_id = "xxxxxx-xxxxxx-xxxxxx"
  project_id      = "{project-id}"
  region          = "asia-northeast1"
  api_services    = ["cloudtasks.googleapis.com"]
  users = [{
    role   = "editor"
    email  = "example@example.com"
    deploy = true
  }]
  service_accounts = [{
    account_id   = "ci-deploy"
    display_name = "Continuous Integration Deployment Service Account"
    type         = "deploy"
    roles        = []
    args = {
      hosting   = true
      functions = true
      firestore = true
      storage   = true
      scheduler = false
      tasks     = false
    }
  }]
  hosting_names = ["{hosting-name}"]
  firestore_backup_buckets = [{
    bucket_name = "firestore-backups"
    soft_delete_policy = {
      retention_duration_seconds = 604800
    }
    export_platform = "cloud_run"
  }]
  storage_buckets = [
    { bucket_name = "user-icons" },
  ]
}

provider "google-beta" {
  project               = local.project_id
  billing_project       = local.project_id
  user_project_override = true
  region                = local.region
}

provider "google" {
  project = local.project_id
  region  = local.region
}

module "firebase" {
  source = "../../"

  api_services             = local.api_services
  organization_id          = local.organization_id
  project_id               = local.project_id
  users                    = local.users
  service_accounts         = local.service_accounts
  hosting_names            = local.hosting_names
  region                   = local.region
  firestore_backup_buckets = local.firestore_backup_buckets
  storage_buckets          = local.storage_buckets
}