locals {
  api_services                 = ["cloudtasks.googleapis.com"]
  organization_id = "xxxxxx-xxxxxx-xxxxxx"
  project_id      = "{project-id}"
  region          = "asia-northeast1"
  editors         = ["example@example.com"]
  hosting_names   = ["{hosting-name}"]
  firestore_backup_bucket_name   = "firestore-buckups"
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

  api_services                 = local.api_services
  organization_id = local.organization_id
  project_id      = local.project_id
  editors         = local.editors
  hosting_names   = local.hosting_names
  region          = local.region
  firestore_backup_bucket_name          = local.firestore_backup_bucket_name
  storage_buckets          = local.storage_buckets
}