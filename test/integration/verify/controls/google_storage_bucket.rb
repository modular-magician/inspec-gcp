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

title 'Test GCP google_storage_bucket resource.'

gcp_project_id = attribute(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
gcp_location = attribute(:gcp_location, default: 'gcp_location', description: 'GCP location')
gcp_storage_bucket_name = attribute(:gcp_storage_bucket_name, default: 'gcp_storage_bucket_name', description: 'The name of the storage bucket')
control 'google_storage_bucket-1.0' do
  impact 1.0
  title 'google_storage_bucket resource test'

  describe google_storage_bucket(name: gcp_storage_bucket_name) do
    it { should exist }
    its('location') { should cmp gcp_location.upcase }

    its('storage_class') { should eq "STANDARD" }
  end

  describe google_storage_bucket(name: "nonexistent") do
    it { should_not exist }
  end
end
