### Storage
data "google_storage_bucket" "this" {
  name = "${var.project}.appspot.com"
}

# firebase for default bucket
resource "google_firebase_storage_bucket" "this" {
  provider  = google-beta
  project   = var.project
  bucket_id = data.google_storage_bucket.this.id
}

resource "google_firebaserules_ruleset" "this" {
  project = var.project

  source {
    files {
      name    = "firebase.storage.rules"
      content = <<EOF
rules_version = '2';
service firebase.storage {
  match /b/{bucket}/o {
    match /{allPaths=**} {
      allow read, write: if false;
    }
  }
}
EOF
    }
  }
}

resource "google_firebaserules_release" "this" {
  name         = "storage/release"
  ruleset_name = "projects/${var.project}/rulesets/${google_firebaserules_ruleset.this.name}"
  project      = var.project
}