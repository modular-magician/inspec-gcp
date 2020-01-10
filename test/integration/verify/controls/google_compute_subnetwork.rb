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

title 'Test GCP google_compute_subnetwork resource.'

gcp_project_id = attribute(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
gcp_location = attribute(:gcp_location, default: 'gcp_location', description: 'The GCP project region.')
subnetwork = attribute('subnetwork', default: {
  "name": "inspec-subnet",
  "ip_cidr_range": "10.2.0.0/16",
  "log_interval": "INTERVAL_10_MIN",
  "log_sampling": 0.5,
  "log_metadata": "INCLUDE_ALL_METADATA"
}, description: 'Compute subnetwork description')
control 'google_compute_subnetwork-1.0' do
  impact 1.0
  title 'google_compute_subnetwork resource test'

  describe google_compute_subnetwork(project: gcp_project_id, region: gcp_location, name: subnetwork['name']) do
    it { should exist }
    its('ip_cidr_range') { should eq subnetwork['ip_cidr_range'] }
    its('log_config.enable') { should be true }
    its('log_config.flow_sampling') { should cmp subnetwork['log_sampling'] }
    its('log_config.aggregation_interval') { should cmp subnetwork['log_interval'] }
    its('log_config.metadata') { should include subnetwork['log_metadata'] }
  end

  describe google_compute_subnetwork(project: gcp_project_id, region: gcp_location, name: 'nonexistent') do
    it { should_not exist }
  end
end
