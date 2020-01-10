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

title 'Test GCP google_compute_target_pools resource.'

gcp_project_id = attribute(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
gcp_location = attribute(:gcp_location, default: 'gcp_location', description: 'The GCP project region.')
gcp_ext_vm_name = attribute(:gcp_ext_vm_name, default: 'gcp_ext_vm_name', description: 'The name of a VM instance.')
target_pool = attribute('target_pool', default: {
  "name": "inspec-gcp-target-pool",
  "session_affinity": "CLIENT_IP"
}, description: 'Target pool definition')
gcp_zone = attribute(:gcp_zone, default: 'gcp_zone', description: 'The GCP zone.')
control 'google_compute_target_pools-1.0' do
  impact 1.0
  title 'google_compute_target_pools resource test'

  describe google_compute_target_pools(project: gcp_project_id, region: gcp_location) do
    its('names') { should include target_pool['name'] }
    its('session_affinities') { should include target_pool['session_affinity'] }
  end
end
