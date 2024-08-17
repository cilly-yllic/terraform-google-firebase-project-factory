output "user_members" {
  value       = [for value in google_project_iam_member.this : value.member]
  description = "Firebase Editor User Members"
}

output "user_roles" {
  value       = [for value in google_project_iam_member.this : value.role]
  description = "Firebase Editor User Roles"
}