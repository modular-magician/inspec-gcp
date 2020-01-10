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

title 'Test GCP google_compute_networks resource.'

gcp_project_id = attribute(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
network = attribute('network', default: {
  "name": "inspec-network",
  "routing_mode": "REGIONAL"
}, description: 'Network description')
control 'google_compute_networks-1.0' do
  impact 1.0
  title 'google_compute_networks resource test'

  describe google_compute_networks(project: gcp_project_id) do
  	its('network_names') { should include network['name'] }
  end
end
