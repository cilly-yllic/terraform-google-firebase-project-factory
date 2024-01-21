output "members" {
  description = "Firebase Editor Member Members"
  value       = [for value in module.google : value.members]
}

output "roles" {
  description = "Firebase Editor Member Roles"
  value       = [for value in module.google : value.roles]
}