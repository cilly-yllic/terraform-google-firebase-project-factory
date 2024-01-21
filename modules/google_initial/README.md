<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.7.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | ~> 5.12.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_google_firebase_project"></a> [google\_firebase\_project](#module\_google\_firebase\_project) | ./google_firebase_project | n/a |
| <a name="module_google_project_service"></a> [google\_project\_service](#module\_google\_project\_service) | ./google_project_service | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_services"></a> [api\_services](#input\_api\_services) | n/a | `list(string)` | `[]` | no |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_firebase_project_id"></a> [firebase\_project\_id](#output\_firebase\_project\_id) | Firebase Project Id. |
| <a name="output_gae_database_type"></a> [gae\_database\_type](#output\_gae\_database\_type) | GAE Database (firestore). |
| <a name="output_gae_location_id"></a> [gae\_location\_id](#output\_gae\_location\_id) | GAE Location. |
| <a name="output_google_project_service_api"></a> [google\_project\_service\_api](#output\_google\_project\_service\_api) | GCP API Enables. |
<!-- END_TF_DOCS -->