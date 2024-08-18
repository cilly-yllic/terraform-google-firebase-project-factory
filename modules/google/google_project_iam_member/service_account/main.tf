locals {
  roles = var.type == "deploy" ? concat([
    "roles/runtimeconfig.admin"
    ],
    var.args.hosting ? ["roles/firebasehosting.admin"] : [],
    var.args.functions ? ["roles/cloudfunctions.admin", "roles/iam.serviceAccountUser"] : [],
    var.args.scheduler ? ["roles/cloudscheduler.admin"] : [],
    var.args.firestore ? ["roles/datastore.indexAdmin", "roles/firebaserules.admin"] : [],
    var.args.storage ? ["roles/firebasestorage.viewer", "roles/storage.objectAdmin", "roles/storage.admin"] : [],
    var.rules,
  ) : []
}

resource "google_service_account" "this" {
  project      = var.project
  account_id   = var.account_id
  display_name = can(var.display_name) ? var.display_name : var.account_id
}

resource "google_project_iam_member" "this" {
  project    = var.project
  for_each   = toset(local.roles)
  role       = each.value
  member     = "serviceAccount:${google_service_account.this.email}"
  depends_on = [google_service_account.this]
}