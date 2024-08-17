locals {
  roles = concat([
    var.role
    ],
    var.deploy ? [
      "roles/cloudfunctions.admin", // 'cloudfunctions.functions.setIamPolicy'対策
      /*
       * [For deploy functions error]
       * Ensure that the Cloud Functions service account has 'artifactregistry.repositories.list' and 'artifactregistry.repositories.get' permissions.
       * You can add the permissions by granting the role 'roles/artifactregistry.reader'.
       */
      "roles/artifactregistry.reader",
    ] : []
  )
}

resource "google_project_iam_member" "this" {
  project  = var.project
  for_each = toset(local.roles)
  role     = each.value
  member   = var.member
}