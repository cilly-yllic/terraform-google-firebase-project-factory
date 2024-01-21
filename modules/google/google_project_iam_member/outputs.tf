output "members" {
  value       = [for value in google_project_iam_member.this : value.member]
  description = "Firebase Editor Member Members"
}

output "roles" {
  value       = [for value in google_project_iam_member.this : value.role]
  description = "Firebase Editor Member Roles"
}