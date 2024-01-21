output "default_bucket_name" {
  description = "Firebase Default Storage Bucket Name."
  value       = module.storage_bucket.default_bucket_name
}

output "default_bucket_id" {
  description = "Firebase Default Storage Bucket Id."
  value       = module.storage_bucket.default_bucket_id
}

output "default_bucket_ruleset_source_content" {
  description = "Firebase Default Storage Bucket Rule."
  value       = module.storage_bucket.default_bucket_ruleset_source_content
}

output "default_bucket_release_ruleset_name" {
  description = "Firebase Default Storage Bucket Ruleset."
  value       = module.storage_bucket.default_bucket_release_ruleset_name
}