module "google_project_iam_member_user" {
  source   = "./google_project_iam_member/user"
  project  = var.project
  for_each = { for user in var.users : user.email => user }
  role     = "roles/${each.value.role}"
  member   = "user:${each.value.email}"
  deploy   = each.value.deploy
}

module "google_project_iam_member_service_account" {
  source       = "./google_project_iam_member/service_account"
  project      = var.project
  for_each     = { for service_account in var.service_accounts : service_account.account_id => service_account }
  account_id   = each.value.account_id
  display_name = can(each.value.display_name) ? each.value.display_name : each.value.account_id
  type         = each.value.type
  roles        = each.value.roles
  args         = each.value.args
}