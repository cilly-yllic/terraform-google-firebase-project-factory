<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.9.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 5.41.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | ~> 5.41.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | ~> 5.41.0 |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | ~> 5.41.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google-beta_google_firebase_storage_bucket.this](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_firebase_storage_bucket) | resource |
| [google-beta_google_storage_bucket.this](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_storage_bucket) | resource |
| [google_project_iam_member.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_storage_bucket_iam_member.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam_member) | resource |
| [google_project.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | n/a | `string` | n/a | yes |
| <a name="input_export_platform"></a> [export\_platform](#input\_export\_platform) | n/a | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_autoclass"></a> [autoclass](#output\_autoclass) | Firebase Backup Firestore Storage Bucket Autoclass. |
| <a name="output_bucket_id"></a> [bucket\_id](#output\_bucket\_id) | Firebase Backup Firestore Storage Bucket. |
| <a name="output_bucket_name"></a> [bucket\_name](#output\_bucket\_name) | Firebase Backup Firestore Storage Bucket Name. |
| <a name="output_lifecycle_rule_action"></a> [lifecycle\_rule\_action](#output\_lifecycle\_rule\_action) | Firebase Backup Firestore Storage Bucket Lifecycle Rule Action. |
| <a name="output_lifecycle_rule_condition"></a> [lifecycle\_rule\_condition](#output\_lifecycle\_rule\_condition) | Firebase Backup Firestore Storage Bucket Lifecycle Rule Condition. |
| <a name="output_location"></a> [location](#output\_location) | Firebase Backup Firestore Storage Bucket Location. |
| <a name="output_project_iam_member"></a> [project\_iam\_member](#output\_project\_iam\_member) | Service Account That Is Granted The Permission To Back Up Firestore Data To Storage |
| <a name="output_project_iam_member_role"></a> [project\_iam\_member\_role](#output\_project\_iam\_member\_role) | Service Account Role That Is Granted The Permission To Back Up Firestore Data To Storage |
| <a name="output_storage_bucket_iam_member"></a> [storage\_bucket\_iam\_member](#output\_storage\_bucket\_iam\_member) | Service Account That Is Granted The Permission To Back Up Firestore Data To Storage |
| <a name="output_storage_bucket_iam_member_role"></a> [storage\_bucket\_iam\_member\_role](#output\_storage\_bucket\_iam\_member\_role) | Service Account Role That Is Granted The Permission To Back Up Firestore Data To Storage |
<!-- END_TF_DOCS -->