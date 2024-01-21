output "firebase_project_id" {
  description = "Firebase Project Id."
  value       = var.project
}

output "gae_location_id" {
  description = "GAE Location."
  value       = google_app_engine_application.this.location_id
}

output "gae_database_type" {
  description = "GAE Database (firestore)."
  value       = google_app_engine_application.this.database_type
}