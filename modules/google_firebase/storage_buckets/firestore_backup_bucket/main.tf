data "google_project" "this" {

}

locals {
  iam_members = {
    cloud_functions : "${var.project}@appspot.gserviceaccount.com"
    cloud_run : "${data.google_project.this.number}-compute@developer.gserviceaccount.com"
  }
}
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

resource "google_project_iam_member" "this" {
  project = var.project
  role    = "roles/datastore.importExportAdmin"
  member  = "serviceAccount:${lookup(local.iam_members, var.export_platform)}"
}

resource "google_storage_bucket_iam_member" "this" {
  bucket     = google_storage_bucket.this.name
  member     = google_project_iam_member.this.member
  role       = "roles/storage.admin"
  depends_on = [google_storage_bucket.this, google_project_iam_member.this]
}