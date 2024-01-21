module "google" {
  source   = "./google_project_iam_member"
  project  = var.project
  for_each = toset(var.editors)
  member   = "user:${each.value}"
}