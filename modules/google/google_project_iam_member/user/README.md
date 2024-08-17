<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.9.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 5.41.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | ~> 5.41.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_project_iam_member.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_deploy"></a> [deploy](#input\_deploy) | n/a | `bool` | `false` | no |
| <a name="input_member"></a> [member](#input\_member) | n/a | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | n/a | yes |
| <a name="input_role"></a> [role](#input\_role) | n/a | `string` | `"roles/viewer"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_user_members"></a> [user\_members](#output\_user\_members) | Firebase Editor User Members |
| <a name="output_user_roles"></a> [user\_roles](#output\_user\_roles) | Firebase Editor User Roles |
<!-- END_TF_DOCS -->