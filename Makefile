terraform-docs-execution:
	terraform-docs ${format} ${sub-format} --output-file README.md --output-mode inject ${path}

g/doc:
	@make terraform-docs-execution format=markdown sub-format=table path=. \
	&& make terraform-docs-execution format=markdown sub-format=table path=modules/google \
	&& make terraform-docs-execution format=markdown sub-format=table path=modules/google/google_project_iam_member/service_account \
	&& make terraform-docs-execution format=markdown sub-format=table path=modules/google/google_project_iam_member/user \
	&& make terraform-docs-execution format=markdown sub-format=table path=modules/google_firebase/hosting_site \
	&& make terraform-docs-execution format=markdown sub-format=table path=modules/google_firebase/storage_buckets/custom_bucket \
	&& make terraform-docs-execution format=markdown sub-format=table path=modules/google_firebase/storage_buckets/firestore_backup_bucket \
	&& make terraform-docs-execution format=markdown sub-format=table path=modules/google_firebase_defaults \
	&& make terraform-docs-execution format=markdown sub-format=table path=modules/google_firebase_defaults/storage_bucket \
	&& make terraform-docs-execution format=markdown sub-format=table path=modules/google_initial \
	&& make terraform-docs-execution format=markdown sub-format=table path=modules/google_initial/google_firebase_project \
	&& make terraform-docs-execution format=markdown sub-format=table path=modules/google_initial/google_project_service