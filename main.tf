/**
 * Usage:
 *
 * ```tf
 * module "firebase" {
 *   source                       = "cilly-yllic/firebase-project-factory/google"
 *   api_services                 = ["cloudtasks.googleapis.com"]
 *   editors                      = ["example@example.com"]
 *   firestore_backup_buckets     = [{
 *     bucket_name                = "firestore-backups"
 *     export_platform            = {
 *       cloud_functions          = false
 *       cloud_run                = true
 *     }
 *   }]
 *   hosting_names                = ["{hosting-name}"]
 *   organization_id              = "xxxxxx-xxxxxx-xxxxxx"
 *   project_id                   = "{project-id}"
 *   region                       = "asia-northeast1"
 *   storage_buckets              = []
 * }
 * ```
 */

locals {
  organization_id          = var.organization_id
  project_id               = var.project_id
  region                   = var.region
  editors                  = var.editors
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
  source     = "./modules/google"
  project    = local.project_id
  editors    = local.editors
  depends_on = [module.google_initial, module.google_firebase_defaults]
}

module "google_firebase_hosting_site" {
  source       = "./modules/google_firebase/hosting_site"
  project      = local.project_id
  for_each     = toset(local.hosting_names)
  hosting_name = each.value
  depends_on   = [module.google_firebase_defaults]
}

module "google_firebase_storage_firestore_backup_bucket" {
  source          = "./modules/google_firebase/storage_buckets/firestore_backup_bucket"
  project         = local.project_id
  region          = local.region
  for_each        = { for i, bucket in local.firestore_backup_buckets : i => bucket }
  bucket_name     = each.value.bucket_name
  export_platform = each.value.export_platform
  depends_on      = [module.google_firebase_defaults]
}

module "google_firebase_storage_custom_bucket" {
  source        = "./modules/google_firebase/storage_buckets/custom_bucket"
  project       = local.project_id
  region        = local.region
  for_each      = { for i, bucket in local.storage_buckets : i => bucket }
  bucket_name   = each.value.bucket_name
  storage_class = each.value.storage_class
  iams          = each.value.iams
  depends_on    = [module.google_firebase_defaults]
}