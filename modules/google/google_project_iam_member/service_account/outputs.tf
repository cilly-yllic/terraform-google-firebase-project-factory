output "service_account_id" {
  value       = google_service_account.this.account_id
  description = "Service Account Ids to configure service account"
}

output "service_account_name" {
  value       = google_service_account.this.display_name
  description = "Service Account names"
}

output "service_account_roles" {
  value       = [for value in google_project_iam_member.this : value.role]
  description = "Service Account Roles created"
}