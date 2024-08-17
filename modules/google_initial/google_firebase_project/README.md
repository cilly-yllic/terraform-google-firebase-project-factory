<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.9.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | ~> 5.41.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | ~> 5.41.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google-beta_google_app_engine_application.this](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_app_engine_application) | resource |
| [google-beta_google_firebase_project.this](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_firebase_project) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_firebase_project_id"></a> [firebase\_project\_id](#output\_firebase\_project\_id) | Firebase Project Id. |
| <a name="output_gae_database_type"></a> [gae\_database\_type](#output\_gae\_database\_type) | GAE Database (firestore). |
| <a name="output_gae_location_id"></a> [gae\_location\_id](#output\_gae\_location\_id) | GAE Location. |
<!-- END_TF_DOCS -->