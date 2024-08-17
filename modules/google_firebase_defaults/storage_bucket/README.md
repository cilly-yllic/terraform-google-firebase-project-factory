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
| [google_firebaserules_release.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebaserules_release) | resource |
| [google_firebaserules_ruleset.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebaserules_ruleset) | resource |
| [google_storage_bucket.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/storage_bucket) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_default_bucket_id"></a> [default\_bucket\_id](#output\_default\_bucket\_id) | Firebase Default Storage Bucket Id. |
| <a name="output_default_bucket_name"></a> [default\_bucket\_name](#output\_default\_bucket\_name) | Firebase Default Storage Bucket Name. |
| <a name="output_default_bucket_release_ruleset_name"></a> [default\_bucket\_release\_ruleset\_name](#output\_default\_bucket\_release\_ruleset\_name) | Firebase Default Storage Bucket Ruleset. |
| <a name="output_default_bucket_ruleset_source_content"></a> [default\_bucket\_ruleset\_source\_content](#output\_default\_bucket\_ruleset\_source\_content) | Firebase Default Storage Bucket Rule. |
<!-- END_TF_DOCS -->