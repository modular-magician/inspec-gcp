# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------

title 'Test GCP google_storage_bucket_objects resource.'

gcp_project_id = attribute(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
gcp_storage_bucket_object = attribute(:gcp_storage_bucket_object, default: 'gcp_storage_bucket_object', description: 'The name of the storage bucket with an object')
gcp_service_account_display_name = attribute(:gcp_service_account_display_name, default: 'gcp_service_account_display_name', description: 'The name of the service account assigned permissions')
gcp_enable_privileged_resources = attribute(:gcp_enable_privileged_resources, default: 'gcp_enable_privileged_resources', description: 'If we are running tests with escalated permissions(required for this test)')
gcp_storage_bucket_object_name = attribute(:gcp_storage_bucket_object_name, default: 'gcp_storage_bucket_object_name', description: 'The name of the object')
control 'google_storage_bucket_objects-1.0' do
  impact 1.0
  title 'google_storage_bucket_objects resource test'

  only_if { gcp_enable_privileged_resources.to_i == 1 }
  describe google_storage_bucket_objects(bucket: gcp_storage_bucket_object) do
  	its('object_names') { should include gcp_storage_bucket_object_name }
  	its('count') { should be <= 10 }
  end
end
