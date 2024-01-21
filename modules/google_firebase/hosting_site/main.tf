### Hosting
resource "google_firebase_web_app" "this" {
  provider     = google-beta
  project      = var.project
  display_name = var.hosting_name
}

resource "google_firebase_hosting_site" "this" {
  provider   = google-beta
  project    = var.project
  site_id    = "${var.project}-${var.hosting_name}"
  app_id     = google_firebase_web_app.this.app_id
  depends_on = [google_firebase_web_app.this]
}