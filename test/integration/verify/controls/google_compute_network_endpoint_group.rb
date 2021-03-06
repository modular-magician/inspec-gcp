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

title 'Test GCP google_compute_network_endpoint_group resource.'

gcp_project_id = attribute(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
network_endpoint_group = attribute('network_endpoint_group', default: {
  "name": "inspec-gcp-endpoint-group",
  "default_port": 90
}, description: 'Network endpoint group description')
gcp_zone = attribute(:gcp_zone, default: 'gcp_zone', description: 'GCP zone name')
control 'google_compute_network_endpoint_group-1.0' do
  impact 1.0
  title 'google_compute_network_endpoint_group resource test'


  describe google_compute_network_endpoint_group(project: gcp_project_id, zone: gcp_zone, name: network_endpoint_group['name']) do
    it { should exist }
    its('default_port') { should cmp network_endpoint_group['default_port'] }
  end

  describe google_compute_network_endpoint_group(project: gcp_project_id, zone: gcp_zone, name: 'nonexistent') do
    it { should_not exist }
  end
end
