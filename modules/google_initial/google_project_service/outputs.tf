output "google_project_service_api" {
  description = "GCP API Enables."
  value       = [for value in google_project_service.this : value.service]
}