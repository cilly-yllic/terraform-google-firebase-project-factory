# Firebase のプロジェクトを立ち上げる
resource "google_firebase_project" "this" {
  provider = google-beta
  project  = var.project
}

resource "google_app_engine_application" "this" {
  provider      = google-beta
  project       = var.project
  location_id   = var.region
  database_type = "CLOUD_FIRESTORE"
  depends_on    = [google_firebase_project.this]
}