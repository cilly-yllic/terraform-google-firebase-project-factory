output "service_account_ids" {
  value       = [for value in google_service_account.this : value.account_id]
  description = "Service Account Ids to configure service account"
}

output "service_account_names" {
  value       = [for value in google_service_account.this : value.display_name]
  description = "Service Account names"
}

output "service_account_roles" {
  value       = [for value in google_project_iam_member.this : value.role]
  description = "Service Account Roles created"
}