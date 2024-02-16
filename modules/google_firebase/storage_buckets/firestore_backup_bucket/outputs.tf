output "bucket_name" {
  description = "Firebase Backup Firestore Storage Bucket Name."
  value       = google_storage_bucket.this.name
}

output "location" {
  description = "Firebase Backup Firestore Storage Bucket Location."
  value       = google_storage_bucket.this.location
}

output "autoclass" {
  description = "Firebase Backup Firestore Storage Bucket Autoclass."
  value       = google_storage_bucket.this.autoclass[0].enabled
}

output "lifecycle_rule_action" {
  description = "Firebase Backup Firestore Storage Bucket Lifecycle Rule Action."
  value       = google_storage_bucket.this.lifecycle_rule[0].action
}

output "lifecycle_rule_condition" {
  description = "Firebase Backup Firestore Storage Bucket Lifecycle Rule Condition."
  value       = google_storage_bucket.this.lifecycle_rule[0].condition
}

output "bucket_id" {
  description = "Firebase Backup Firestore Storage Bucket."
  value       = google_firebase_storage_bucket.this.bucket_id
}

output "project_iam_member" {
  description = "Service Account That Is Granted The Permission To Back Up Firestore Data To Storage"
  value       = google_project_iam_member.this.member
}

output "project_iam_member_role" {
  description = "Service Account Role That Is Granted The Permission To Back Up Firestore Data To Storage"
  value       = google_project_iam_member.this.role
}

output "storage_bucket_iam_member" {
  description = "Service Account That Is Granted The Permission To Back Up Firestore Data To Storage"
  value       = google_storage_bucket_iam_member.this.member
}

output "storage_bucket_iam_member_role" {
  description = "Service Account Role That Is Granted The Permission To Back Up Firestore Data To Storage"
  value       = google_storage_bucket_iam_member.this.role
}