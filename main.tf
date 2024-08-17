/**
 * Usage:
 *
 * ```tf
 * module "firebase" {
 *   source          = "cilly-yllic/firebase-project-factory/google"
 *   version         = "{version}"
 *   organization_id = "xxxxxx-xxxxxx-xxxxxx"
 *   project_id      = "{project-id}"
 *   region          = "asia-northeast1"
 *   api_services    = ["cloudtasks.googleapis.com"]
 *   users = [{
 *     role   = "editor"
 *     email  = "example@example.com"
 *     deploy = true
 *   }]
 *   service_accounts = [{
 *     account_id   = "ci-deploy"
 *     display_name = "Continuous Integration Deployment Service Account"
 *     type         = "deploy"
 *     args = {
 *       hosting          = true
 *       functions        = true
 *       firestore        = true
 *       storage          = true
 *       scheduler        = false
 *       additional_rules = []
 *     }
 *   }]
 *   hosting_names = ["{hosting-name}"]
 *   firestore_backup_buckets = [{
 *     bucket_name = "firestore-backups"
 *     soft_delete_policy = {
 *       retention_duration_seconds = 604800
 *     }
 *     export_platform = "cloud_run"
 *   }]
 *   storage_buckets = [
 *     { bucket_name = "user-icons" },
 *   ]
 * }
 * ```
 */

locals {
  organization_id          = var.organization_id
  project_id               = var.project_id
  region                   = var.region
  users                    = var.users
  service_accounts         = var.service_accounts
  hosting_names            = var.hosting_names
  api_services             = var.api_services
  firestore_backup_buckets = var.firestore_backup_buckets
  storage_buckets          = var.storage_buckets
}

module "google_initial" {
  source       = "./modules/google_initial"
  project      = local.project_id
  region       = local.region
  api_services = local.api_services
}

module "google_firebase_defaults" {
  source     = "./modules/google_firebase_defaults"
  project    = local.project_id
  depends_on = [module.google_initial]
}

module "google" {
  source           = "./modules/google"
  project          = local.project_id
  users            = local.users
  service_accounts = local.service_accounts
  depends_on       = [module.google_initial, module.google_firebase_defaults]
}

module "google_firebase_hosting_site" {
  source       = "./modules/google_firebase/hosting_site"
  project      = local.project_id
  for_each     = toset(local.hosting_names)
  hosting_name = each.value
  depends_on   = [module.google_firebase_defaults]
}

module "google_firebase_storage_firestore_backup_bucket" {
  source             = "./modules/google_firebase/storage_buckets/firestore_backup_bucket"
  project            = local.project_id
  region             = local.region
  for_each           = { for i, bucket in local.firestore_backup_buckets : i => bucket }
  bucket_name        = each.value.bucket_name
  soft_delete_policy = each.value.soft_delete_policy
  export_platform    = each.value.export_platform
  depends_on         = [module.google_firebase_defaults]
}

module "google_firebase_storage_custom_bucket" {
  source             = "./modules/google_firebase/storage_buckets/custom_bucket"
  project            = local.project_id
  region             = local.region
  for_each           = { for i, bucket in local.storage_buckets : i => bucket }
  bucket_name        = each.value.bucket_name
  storage_class      = each.value.storage_class
  soft_delete_policy = each.value.soft_delete_policy
  iams               = each.value.iams
  depends_on         = [module.google_firebase_defaults]
}