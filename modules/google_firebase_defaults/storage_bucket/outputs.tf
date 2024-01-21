output "default_bucket_name" {
  description = "Firebase Default Storage Bucket Name."
  value       = data.google_storage_bucket.this.name
}

output "default_bucket_id" {
  description = "Firebase Default Storage Bucket Id."
  value       = google_firebase_storage_bucket.this.bucket_id
}

output "default_bucket_ruleset_source_content" {
  description = "Firebase Default Storage Bucket Rule."
  value       = google_firebaserules_ruleset.this.source[0].files[0].content
}

output "default_bucket_release_ruleset_name" {
  description = "Firebase Default Storage Bucket Ruleset."
  value       = google_firebaserules_release.this.ruleset_name
}