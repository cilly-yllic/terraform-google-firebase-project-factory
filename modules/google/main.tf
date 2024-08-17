module "google_project_iam_member_user" {
  source   = "./google_project_iam_member/user"
  project  = var.project
  for_each = toset(var.users)
  role     = "roles/${each.value.role}"
  member   = "user:${each.value.email}"
  deploy   = each.value.deploy
}

module "google_project_iam_member_service_account" {
  source       = "./google_project_iam_member/service_account"
  project      = var.project
  for_each     = toset(var.service_accounts)
  account_id   = each.value.account_id
  display_name = each.value.display_name ? each.value.display_name : each.value.account_id
  type         = each.value.type
  args         = each.value.args
}