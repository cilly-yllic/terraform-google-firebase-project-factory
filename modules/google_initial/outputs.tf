output "firebase_project_id" {
  description = "Firebase Project Id."
  value       = module.google_firebase_project.firebase_project_id
  depends_on  = [module.google_firebase_project, module.google_project_service]
}

output "gae_location_id" {
  description = "GAE Location."
  value       = module.google_firebase_project.gae_location_id
  depends_on  = [module.google_firebase_project, module.google_project_service]
}

output "gae_database_type" {
  description = "GAE Database (firestore)."
  value       = module.google_firebase_project.gae_database_type
  depends_on  = [module.google_firebase_project, module.google_project_service]
}

output "google_project_service_api" {
  description = "GCP API Enables."
  value       = module.google_project_service.google_project_service_api
}