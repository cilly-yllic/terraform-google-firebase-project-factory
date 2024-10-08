output "project_id" {
  description = "Firebase Project Id."
  value       = module.google_initial.firebase_project_id
}

output "gae_location_id" {
  description = "GAE Location."
  value       = module.google_initial.gae_location_id
}

output "gae_database_type" {
  description = "GAE Database (firestore)."
  value       = module.google_initial.gae_database_type
}

output "google_project_service_api" {
  description = "GCP API Enables."
  value       = module.google_initial.google_project_service_api
}

output "default_bucket_name" {
  description = "Firebase Default Storage Bucket Name."
  value       = module.google_firebase_defaults.default_bucket_name
}

output "default_bucket_id" {
  description = "Firebase Default Storage Bucket Id."
  value       = module.google_firebase_defaults.default_bucket_id
}

output "default_bucket_ruleset_source_content" {
  description = "Firebase Default Storage Bucket Rule."
  value       = module.google_firebase_defaults.default_bucket_ruleset_source_content
}

output "default_bucket_release_ruleset_name" {
  description = "Firebase Default Storage Bucket Ruleset."
  value       = module.google_firebase_defaults.default_bucket_release_ruleset_name
}

output "user_members" {
  description = "Firebase Editor User Members"
  value       = module.google.*.user_members
}

output "user_roles" {
  description = "Firebase Editor User Roles"
  value       = module.google.*.user_roles
}

output "service_account_ids" {
  description = "Service Account Ids to configure service account"
  value       = module.google.*.service_account_ids
}

output "service_account_names" {
  description = "Service Account names"
  value       = module.google.*.service_account_names
}

output "service_account_roles" {
  description = "Service Account Roles created"
  value       = module.google.*.service_account_roles
}

output "display_name" {
  description = "Firebase Web Application Name."
  value       = [for value in module.google_firebase_hosting_site : value.display_name]
}

output "app_id" {
  description = "Firebase Web Application ID."
  value       = [for value in module.google_firebase_hosting_site : value.app_id]
}

output "site_id" {
  description = "Firebase Hosting Site ID."
  value       = [for value in module.google_firebase_hosting_site : value.site_id]
}

output "firestore_backup_bucket_name" {
  description = "Firebase Backup Firestore Storage Bucket Name."
  value       = [for value in module.google_firebase_storage_firestore_backup_bucket : value.bucket_name]
}

output "firestore_backup_bucket_location" {
  description = "Firebase Backup Firestore Storage Bucket Location."
  value       = [for value in module.google_firebase_storage_firestore_backup_bucket : value.location]
}

output "firestore_backup_bucket_autoclass" {
  description = "Firebase Backup Firestore Storage Bucket Autoclass."
  value       = [for value in module.google_firebase_storage_firestore_backup_bucket : value.autoclass]
}

output "firestore_backup_bucket_lifecycle_rule_action" {
  description = "Firebase Backup Firestore Storage Bucket Lifecycle Rule Action."
  value       = [for value in module.google_firebase_storage_firestore_backup_bucket : value.lifecycle_rule_action]
}

output "firestore_backup_bucket_lifecycle_rule_condition" {
  description = "Firebase Backup Firestore Storage Bucket Lifecycle Rule Condition."
  value       = [for value in module.google_firebase_storage_firestore_backup_bucket : value.lifecycle_rule_condition]
}

output "firestore_backup_bucket_id" {
  description = "Firebase Backup Firestore Storage Bucket."
  value       = [for value in module.google_firebase_storage_firestore_backup_bucket : value.bucket_id]
}

output "firestore_backup_bucket_project_iam_member" {
  description = "Service Account That Is Granted The Permission To Back Up Firestore Data To Storage"
  value       = [for value in module.google_firebase_storage_firestore_backup_bucket : value.project_iam_member]
}

output "firestore_backup_bucket_project_iam_member_role" {
  description = "Service Account Role That Is Granted The Permission To Back Up Firestore Data To Storage"
  value       = [for value in module.google_firebase_storage_firestore_backup_bucket : value.project_iam_member_role]
}

output "firestore_backup_bucket_storage_bucket_iam_member" {
  description = "Service Account That Is Granted The Permission To Back Up Firestore Data To Storage"
  value       = [for value in module.google_firebase_storage_firestore_backup_bucket : value.storage_bucket_iam_member]
}

output "firestore_backup_bucket_storage_bucket_iam_member_role" {
  description = "Service Account Role That Is Granted The Permission To Back Up Firestore Data To Storage"
  value       = [for value in module.google_firebase_storage_firestore_backup_bucket : value.storage_bucket_iam_member_role]
}

output "custom_bucket_name" {
  description = "Firebase Backup Firestore Storage Bucket Name."
  value       = [for value in module.google_firebase_storage_custom_bucket : value.bucket_name]
}

output "custom_bucket_location" {
  description = "Firebase Backup Firestore Storage Bucket Location."
  value       = [for value in module.google_firebase_storage_custom_bucket : value.location]
}

output "custom_bucket_id" {
  description = "Firebase Backup Firestore Storage Bucket Id."
  value       = [for value in module.google_firebase_storage_custom_bucket : value.bucket_id]
}

output "custom_bucket_roles" {
  description = "Firebase Backup Firestore Storage Bucket Role."
  value       = [for value in module.google_firebase_storage_custom_bucket : value.roles]
}

output "custom_bucket_members" {
  description = "Firebase Backup Firestore Storage Bucket Members."
  value       = [for value in module.google_firebase_storage_custom_bucket : value.members]
}