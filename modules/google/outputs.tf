output "user_members" {
  description = "Firebase Editor User Members"
  value       = [for value in module.google_project_iam_member_user : value.user_members]
}

output "user_roles" {
  description = "Firebase Editor User Roles"
  value       = [for value in module.google_project_iam_member_user : value.user_roles]
}

output "service_account_ids" {
  description = "Service Account Ids to configure service account"
  value       = [for value in module.google_project_iam_member_service_account : value.service_account_ids]
}

output "service_account_names" {
  description = "Service Account names"
  value       = [for value in module.google_project_iam_member_service_account : value.service_account_names]
}

output "service_account_roles" {
  description = "Service Account Roles created"
  value       = [for value in module.google_project_iam_member_service_account : value.service_account_roles]
}