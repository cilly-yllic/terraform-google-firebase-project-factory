output "display_name" {
  description = "Firebase Web Application Name."
  value       = google_firebase_web_app.this.display_name
}

output "app_id" {
  description = "Firebase Web Application ID."
  value       = google_firebase_web_app.this.app_id
}

output "site_id" {
  description = "Firebase Hosting Site ID."
  value       = google_firebase_hosting_site.this.site_id
}