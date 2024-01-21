locals {
  services = concat(
    [
      "cloudbilling.googleapis.com",
      "cloudresourcemanager.googleapis.com",
      "identitytoolkit.googleapis.com",
      "firebase.googleapis.com",
      "appengine.googleapis.com",
      "firebasestorage.googleapis.com",
      "firestore.googleapis.com",        // firestore rule
      "cloudfunctions.googleapis.com",   // functions
      "cloudbuild.googleapis.com",       // functions
      "artifactregistry.googleapis.com", // functions
      "eventarc.googleapis.com",         // functions event
      "cloudscheduler.googleapis.com",   // functions schedule
      "run.googleapis.com",              // functions cloud run
    ],
    var.services
  )
}
resource "google_project_service" "this" {
  provider                   = google-beta
  project                    = var.project
  for_each                   = toset(local.services)
  service                    = each.value
  disable_on_destroy         = false
  disable_dependent_services = true
}