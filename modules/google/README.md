<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.9.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 5.41.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_google_project_iam_member_service_account"></a> [google\_project\_iam\_member\_service\_account](#module\_google\_project\_iam\_member\_service\_account) | ./google_project_iam_member/service_account | n/a |
| <a name="module_google_project_iam_member_user"></a> [google\_project\_iam\_member\_user](#module\_google\_project\_iam\_member\_user) | ./google_project_iam_member/user | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | n/a | yes |
| <a name="input_service_accounts"></a> [service\_accounts](#input\_service\_accounts) | n/a | <pre>list(object({<br>    account_id   = string<br>    display_name = optional(string)<br>    type         = string # deploy<br>    rules        = optional(list(string), [])<br>    args         = optional(any, {})<br>  }))</pre> | `[]` | no |
| <a name="input_users"></a> [users](#input\_users) | n/a | <pre>list(object({<br>    role   = optional(string, "viewer") # viewer | editor | owner<br>    email  = string<br>    deploy = optional(bool, false)<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_account_ids"></a> [service\_account\_ids](#output\_service\_account\_ids) | Service Account Ids to configure service account |
| <a name="output_service_account_names"></a> [service\_account\_names](#output\_service\_account\_names) | Service Account names |
| <a name="output_service_account_roles"></a> [service\_account\_roles](#output\_service\_account\_roles) | Service Account Roles created |
| <a name="output_user_members"></a> [user\_members](#output\_user\_members) | Firebase Editor User Members |
| <a name="output_user_roles"></a> [user\_roles](#output\_user\_roles) | Firebase Editor User Roles |
<!-- END_TF_DOCS -->