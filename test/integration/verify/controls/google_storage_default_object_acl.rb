# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
#     ***     DIFF TEST DIFF TEST    ***
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

title 'Test GCP google_storage_default_object_acl resource.'

gcp_project_id = attribute(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
gcp_storage_bucket_name = attribute(:gcp_storage_bucket_name, default: 'gcp_storage_bucket_name', description: 'The name of the storage bucket with the default object ACL')
gcp_service_account_display_name = attribute(:gcp_service_account_display_name, default: 'gcp_service_account_display_name', description: 'The name of the service account assigned permissions')
gcp_enable_privileged_resources = attribute(:gcp_enable_privileged_resources, default: 'gcp_enable_privileged_resources', description: 'If we are running tests with escalated permissions(required for this test)')
control 'google_storage_default_object_acl-1.0' do
  impact 1.0
  title 'google_storage_default_object_acl resource test'

  only_if { gcp_enable_privileged_resources.to_i == 1 }
  describe google_storage_default_object_acl(bucket: gcp_storage_bucket_name, entity: "user-#{gcp_service_account_display_name}@#{gcp_project_id}.iam.gserviceaccount.com") do
    it { should exist }
    its('role') { should cmp "OWNER" }

    its('bucket') { should eq gcp_storage_bucket_name }
    its('email') { should include "#{gcp_service_account_display_name}@#{gcp_project_id}.iam.gserviceaccount.com" }
  end

  describe google_storage_default_object_acl(bucket: gcp_storage_bucket_name, entity: "allUsers") do
    it { should_not exist }
  end
end
