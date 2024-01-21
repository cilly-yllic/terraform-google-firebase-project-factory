resource "google_storage_bucket" "this" {
  name     = "${var.project}-${var.bucket_name}"
  location = var.region
  provider = google-beta

  autoclass {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 7 * 365
    }
  }
}

resource "google_firebase_storage_bucket" "this" {
  provider  = google-beta
  project   = var.project
  bucket_id = google_storage_bucket.this.id
}