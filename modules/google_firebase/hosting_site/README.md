<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.7.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | ~> 5.12.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | ~> 5.12.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google-beta_google_firebase_hosting_site.this](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_firebase_hosting_site) | resource |
| [google-beta_google_firebase_web_app.this](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_firebase_web_app) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_hosting_name"></a> [hosting\_name](#input\_hosting\_name) | n/a | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_id"></a> [app\_id](#output\_app\_id) | Firebase Web Application ID. |
| <a name="output_display_name"></a> [display\_name](#output\_display\_name) | Firebase Web Application Name. |
| <a name="output_site_id"></a> [site\_id](#output\_site\_id) | Firebase Hosting Site ID. |
<!-- END_TF_DOCS -->