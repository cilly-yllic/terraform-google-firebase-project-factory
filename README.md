# terraform-google-firebase-project-factory

# What Is This Module
1. Enable required APIs
    - By adding it to `api_services`, it is added to the process that is enabled by default and is enabled in the same way.
    - ↓ Add Default APIs 
      - cloudbilling.googleapis.com
      - cloudresourcemanager.googleapis.com
      - identitytoolkit.googleapis.com
      - firebase.googleapis.com
      - appengine.googleapis.com
      - firebasestorage.googleapis.com
      - firestore.googleapis.com
      - cloudfunctions.googleapis.com
      - cloudbuild.googleapis.com
      - artifactregistry.googleapis.com
      - eventarc.googleapis.com
      - cloudscheduler.googleapis.com
      - run.googleapis.com
2. Create the Storage Bucket that is created by default.
    - In the past, if you didn't do this, even if you created another bucket, you couldn't see it when you tried to check storage in the Firebase Console.
3. Add a web app and create a Hosting site.
    - If you pass an empty array to `hosting_names`, hosting will not be created.
4. Create a Storage Bucket for backing up Firestore data.
    - If you don't give `firestore_backup_buckets`, it will not be created.
    - If it is created, the lifecycle will be set to autoclass and deleted in 7 years.
    - also if you give `export_platform = cloud_functions` or `export_platform = cloud_run` add iam `roles/datastore.importExportAdmin` to `PROJECT_ID@appspot.gserviceaccount.com` or `PROJECT_NUMBER@-compute@developer.gserviceaccount.com`
    - ref: [Create a Cloud Function and a Cloud Scheduler job](https://firebase.google.com/docs/firestore/solutions/schedule-export?hl=ja#configure_access_permissions)
5. Create a bucket other than the above Storage Bucket.
    - If only the bucket name is given, the view permission will be set to public automatically. You can also make any settings by setting `role` and `members`. If you pass an empty array to `iams`, nothing will be set.


<!-- BEGIN_TF_DOCS -->
Usage:

```tf
module "firebase" {
  source          = "cilly-yllic/firebase-project-factory/google"
  version         = "{version}"
  organization_id = "xxxxxx-xxxxxx-xxxxxx"
  project_id      = "{project-id}"
  region          = "asia-northeast1"
  # if service_accounts is not empty put iam.googleapis.com
  # if deploy cloudtasks put cloudtasks.googleapis.com
  api_services    = ["cloudtasks.googleapis.com"]
  users = [{
    role   = "editor"
    email  = "example@example.com"
    deploy = true
  }]
  service_accounts = [{
    account_id   = "ci-deploy"
    display_name = "Continuous Integration Deployment Service Account"
    type         = "deploy"
    roles        = []
    args = {
      hosting   = true
      functions = true
      firestore = true
      storage   = true
      scheduler = false
      tasks     = false
      blocking  = false
    }
  }]
  hosting_names = ["{hosting-name}"]
  firestore_backup_buckets = [{
    bucket_name = "firestore-backups"
    soft_delete_policy = {
      retention_duration_seconds = 604800
    }
    export_platform = "cloud_run"
  }]
  storage_buckets = [
    { bucket_name = "user-icons" },
  ]
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.9.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 5.41.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | ~> 5.41.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_google"></a> [google](#module\_google) | ./modules/google | n/a |
| <a name="module_google_firebase_defaults"></a> [google\_firebase\_defaults](#module\_google\_firebase\_defaults) | ./modules/google_firebase_defaults | n/a |
| <a name="module_google_firebase_hosting_site"></a> [google\_firebase\_hosting\_site](#module\_google\_firebase\_hosting\_site) | ./modules/google_firebase/hosting_site | n/a |
| <a name="module_google_firebase_storage_custom_bucket"></a> [google\_firebase\_storage\_custom\_bucket](#module\_google\_firebase\_storage\_custom\_bucket) | ./modules/google_firebase/storage_buckets/custom_bucket | n/a |
| <a name="module_google_firebase_storage_firestore_backup_bucket"></a> [google\_firebase\_storage\_firestore\_backup\_bucket](#module\_google\_firebase\_storage\_firestore\_backup\_bucket) | ./modules/google_firebase/storage_buckets/firestore_backup_bucket | n/a |
| <a name="module_google_initial"></a> [google\_initial](#module\_google\_initial) | ./modules/google_initial | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_services"></a> [api\_services](#input\_api\_services) | if service\_accounts is not empty put iam.googleapis.com if deploy cloudtasks put cloudtasks.googleapis.com | `list(string)` | `[]` | no |
| <a name="input_firestore_backup_buckets"></a> [firestore\_backup\_buckets](#input\_firestore\_backup\_buckets) | Backups of Firestore. | <pre>list(object({<br>    bucket_name = string<br>    soft_delete_policy = optional(object({<br>      retention_duration_seconds = number<br>    }), { retention_duration_seconds : 0 })<br>    export_platform = optional(string, "cloud_functions")<br>  }))</pre> | `[]` | no |
| <a name="input_hosting_names"></a> [hosting\_names](#input\_hosting\_names) | Firebase project Hosting names. | `list(string)` | `[]` | no |
| <a name="input_organization_id"></a> [organization\_id](#input\_organization\_id) | GCP organizationId. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Firebase project id | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Firebase project region. | `string` | `"asia-northeast1"` | no |
| <a name="input_service_accounts"></a> [service\_accounts](#input\_service\_accounts) | Firebase project Service Accounts list. | <pre>list(object({<br>    account_id   = string<br>    display_name = optional(string)<br>    type         = string # deploy<br>    roles        = optional(list(string), [])<br>    args         = optional(any, {})<br>  }))</pre> | `[]` | no |
| <a name="input_storage_buckets"></a> [storage\_buckets](#input\_storage\_buckets) | Firebase project Hosting names. | <pre>list(object({<br>    bucket_name   = string // this to be -> {project-id}-{bucket_name}<br>    storage_class = optional(string, "REGIONAL")<br>    soft_delete_policy = optional(object({<br>      retention_duration_seconds = number<br>    }), { retention_duration_seconds : 0 })<br>    iams = optional(list(object({<br>      role    = string<br>      members = list(string)<br>      })), [{<br>      role    = "roles/storage.legacyObjectReader"<br>      members = ["allUsers"]<br>    }])<br>  }))</pre> | `[]` | no |
| <a name="input_users"></a> [users](#input\_users) | Firebase project Development member's emails. | <pre>list(object({<br>    role   = optional(string, "viewer") # viewer | editor | owner<br>    email  = string<br>    deploy = optional(bool, false)<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_id"></a> [app\_id](#output\_app\_id) | Firebase Web Application ID. |
| <a name="output_custom_bucket_id"></a> [custom\_bucket\_id](#output\_custom\_bucket\_id) | Firebase Backup Firestore Storage Bucket Id. |
| <a name="output_custom_bucket_location"></a> [custom\_bucket\_location](#output\_custom\_bucket\_location) | Firebase Backup Firestore Storage Bucket Location. |
| <a name="output_custom_bucket_members"></a> [custom\_bucket\_members](#output\_custom\_bucket\_members) | Firebase Backup Firestore Storage Bucket Members. |
| <a name="output_custom_bucket_name"></a> [custom\_bucket\_name](#output\_custom\_bucket\_name) | Firebase Backup Firestore Storage Bucket Name. |
| <a name="output_custom_bucket_roles"></a> [custom\_bucket\_roles](#output\_custom\_bucket\_roles) | Firebase Backup Firestore Storage Bucket Role. |
| <a name="output_default_bucket_id"></a> [default\_bucket\_id](#output\_default\_bucket\_id) | Firebase Default Storage Bucket Id. |
| <a name="output_default_bucket_name"></a> [default\_bucket\_name](#output\_default\_bucket\_name) | Firebase Default Storage Bucket Name. |
| <a name="output_default_bucket_release_ruleset_name"></a> [default\_bucket\_release\_ruleset\_name](#output\_default\_bucket\_release\_ruleset\_name) | Firebase Default Storage Bucket Ruleset. |
| <a name="output_default_bucket_ruleset_source_content"></a> [default\_bucket\_ruleset\_source\_content](#output\_default\_bucket\_ruleset\_source\_content) | Firebase Default Storage Bucket Rule. |
| <a name="output_display_name"></a> [display\_name](#output\_display\_name) | Firebase Web Application Name. |
| <a name="output_firestore_backup_bucket_autoclass"></a> [firestore\_backup\_bucket\_autoclass](#output\_firestore\_backup\_bucket\_autoclass) | Firebase Backup Firestore Storage Bucket Autoclass. |
| <a name="output_firestore_backup_bucket_id"></a> [firestore\_backup\_bucket\_id](#output\_firestore\_backup\_bucket\_id) | Firebase Backup Firestore Storage Bucket. |
| <a name="output_firestore_backup_bucket_lifecycle_rule_action"></a> [firestore\_backup\_bucket\_lifecycle\_rule\_action](#output\_firestore\_backup\_bucket\_lifecycle\_rule\_action) | Firebase Backup Firestore Storage Bucket Lifecycle Rule Action. |
| <a name="output_firestore_backup_bucket_lifecycle_rule_condition"></a> [firestore\_backup\_bucket\_lifecycle\_rule\_condition](#output\_firestore\_backup\_bucket\_lifecycle\_rule\_condition) | Firebase Backup Firestore Storage Bucket Lifecycle Rule Condition. |
| <a name="output_firestore_backup_bucket_location"></a> [firestore\_backup\_bucket\_location](#output\_firestore\_backup\_bucket\_location) | Firebase Backup Firestore Storage Bucket Location. |
| <a name="output_firestore_backup_bucket_name"></a> [firestore\_backup\_bucket\_name](#output\_firestore\_backup\_bucket\_name) | Firebase Backup Firestore Storage Bucket Name. |
| <a name="output_firestore_backup_bucket_project_iam_member"></a> [firestore\_backup\_bucket\_project\_iam\_member](#output\_firestore\_backup\_bucket\_project\_iam\_member) | Service Account That Is Granted The Permission To Back Up Firestore Data To Storage |
| <a name="output_firestore_backup_bucket_project_iam_member_role"></a> [firestore\_backup\_bucket\_project\_iam\_member\_role](#output\_firestore\_backup\_bucket\_project\_iam\_member\_role) | Service Account Role That Is Granted The Permission To Back Up Firestore Data To Storage |
| <a name="output_firestore_backup_bucket_storage_bucket_iam_member"></a> [firestore\_backup\_bucket\_storage\_bucket\_iam\_member](#output\_firestore\_backup\_bucket\_storage\_bucket\_iam\_member) | Service Account That Is Granted The Permission To Back Up Firestore Data To Storage |
| <a name="output_firestore_backup_bucket_storage_bucket_iam_member_role"></a> [firestore\_backup\_bucket\_storage\_bucket\_iam\_member\_role](#output\_firestore\_backup\_bucket\_storage\_bucket\_iam\_member\_role) | Service Account Role That Is Granted The Permission To Back Up Firestore Data To Storage |
| <a name="output_gae_database_type"></a> [gae\_database\_type](#output\_gae\_database\_type) | GAE Database (firestore). |
| <a name="output_gae_location_id"></a> [gae\_location\_id](#output\_gae\_location\_id) | GAE Location. |
| <a name="output_google_project_service_api"></a> [google\_project\_service\_api](#output\_google\_project\_service\_api) | GCP API Enables. |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | Firebase Project Id. |
| <a name="output_service_account_ids"></a> [service\_account\_ids](#output\_service\_account\_ids) | Service Account Ids to configure service account |
| <a name="output_service_account_names"></a> [service\_account\_names](#output\_service\_account\_names) | Service Account names |
| <a name="output_service_account_roles"></a> [service\_account\_roles](#output\_service\_account\_roles) | Service Account Roles created |
| <a name="output_site_id"></a> [site\_id](#output\_site\_id) | Firebase Hosting Site ID. |
| <a name="output_user_members"></a> [user\_members](#output\_user\_members) | Firebase Editor User Members |
| <a name="output_user_roles"></a> [user\_roles](#output\_user\_roles) | Firebase Editor User Roles |
<!-- END_TF_DOCS -->