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

title 'Test GCP google_filestore_instance resource.'

gcp_project_id = attribute(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
filestore_instance = attribute('filestore_instance', default: {"name"=>"inspecgcp", "zone"=>"us-central1-b", "tier"=>"PREMIUM", "fileshare_capacity_gb"=>2660, "fileshare_name"=>"inspecgcp", "network_name"=>"default", "network_mode"=>"MODE_IPV4"})
control 'google_filestore_instance-1.0' do
  impact 1.0
  title 'google_filestore_instance resource test'

  describe google_filestore_instance(project: gcp_project_id, zone: filestore_instance['zone'], name: filestore_instance['name']) do
    it { should exist }
    its('tier') { should cmp filestore_instance['tier'] }
    its('file_shares.count') { should cmp 1 }
    its('file_shares.first.capacity_gb') { should cmp filestore_instance['fileshare_capacity_gb'] }
    its('file_shares.first.name') { should cmp filestore_instance['fileshare_name'] }
    its('networks.count') { should cmp 1 }
    its('networks.first.network') { should cmp filestore_instance['network_name'] }
    its('networks.first.modes') { should include filestore_instance['network_mode'] }
  end

  describe google_filestore_instance(project: gcp_project_id, zone: filestore_instance['zone'], name: 'nonexistent') do
    it { should_not exist }
  end
end
