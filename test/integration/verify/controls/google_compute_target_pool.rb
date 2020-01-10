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

title 'Test GCP google_compute_target_pool resource.'

gcp_project_id = attribute(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
gcp_location = attribute(:gcp_location, default: 'gcp_location', description: 'The GCP project region.')
gcp_ext_vm_name = attribute(:gcp_ext_vm_name, default: 'gcp_ext_vm_name', description: 'The name of a VM instance.')
target_pool = attribute('target_pool', default: {
  "name": "inspec-gcp-target-pool",
  "session_affinity": "CLIENT_IP"
}, description: 'Target pool definition')
gcp_zone = attribute(:gcp_zone, default: 'gcp_zone', description: 'The GCP zone.')
control 'google_compute_target_pool-1.0' do
  impact 1.0
  title 'google_compute_target_pool resource test'

  describe google_compute_target_pool(project: gcp_project_id, region: gcp_location, name: target_pool['name']) do
    it { should exist }
    its('session_affinity') { should eq target_pool['session_affinity'] }
    it { should has_target_instance(gcp_ext_vm_name, gcp_zone) }
  end

  describe google_compute_target_pool(project: gcp_project_id, region: gcp_location, name: 'nonexistent') do
    it { should_not exist }
  end
end
