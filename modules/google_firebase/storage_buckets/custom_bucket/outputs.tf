output "bucket_name" {
  description = "Firebase Backup Firestore Storage Bucket Name."
  value       = google_storage_bucket.this.name
}

output "location" {
  description = "Firebase Backup Firestore Storage Bucket Location."
  value       = google_storage_bucket.this.location
}

output "bucket_id" {
  description = "Firebase Backup Firestore Storage Bucket Id."
  value       = google_firebase_storage_bucket.this.bucket_id
}

output "roles" {
  description = "Firebase Backup Firestore Storage Bucket Role."
  value       = [for value in google_storage_bucket_iam_binding.this : value.role]
}

output "members" {
  description = "Firebase Backup Firestore Storage Bucket Members."
  value       = [for value in google_storage_bucket_iam_binding.this : value.members]
}
