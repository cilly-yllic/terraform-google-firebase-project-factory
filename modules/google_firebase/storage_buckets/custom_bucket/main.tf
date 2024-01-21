resource "google_storage_bucket" "this" {
  name          = "${var.project}-${var.bucket_name}"
  location      = var.region
  provider      = google-beta
  storage_class = var.storage_class
}

resource "google_firebase_storage_bucket" "this" {
  provider  = google-beta
  project   = var.project
  bucket_id = google_storage_bucket.this.id
}

resource "google_storage_bucket_iam_binding" "this" {
  bucket   = google_storage_bucket.this.name
  for_each = { for i, iam in var.iams : i => iam }
  role     = each.value.role
  members  = each.value.members
}