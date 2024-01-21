<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.7.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 5.12.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | ~> 5.12.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | ~> 5.12.0 |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | ~> 5.12.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google-beta_google_firebase_storage_bucket.this](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_firebase_storage_bucket) | resource |
| [google-beta_google_storage_bucket.this](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_storage_bucket) | resource |
| [google_storage_bucket_iam_binding.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam_binding) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | n/a | `string` | n/a | yes |
| <a name="input_iams"></a> [iams](#input\_iams) | n/a | <pre>list(object({<br>    role    = string<br>    members = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_storage_class"></a> [storage\_class](#input\_storage\_class) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_id"></a> [bucket\_id](#output\_bucket\_id) | Firebase Backup Firestore Storage Bucket Id. |
| <a name="output_bucket_name"></a> [bucket\_name](#output\_bucket\_name) | Firebase Backup Firestore Storage Bucket Name. |
| <a name="output_location"></a> [location](#output\_location) | Firebase Backup Firestore Storage Bucket Location. |
| <a name="output_members"></a> [members](#output\_members) | Firebase Backup Firestore Storage Bucket Members. |
| <a name="output_roles"></a> [roles](#output\_roles) | Firebase Backup Firestore Storage Bucket Role. |
<!-- END_TF_DOCS -->