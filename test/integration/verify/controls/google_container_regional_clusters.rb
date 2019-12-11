# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Nathan is editing this to generate diffs in lots of files.
#     He won't submit this change.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------

title 'Test GCP google_container_regional_clusters resource.'

gcp_project_id = attribute(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
gcp_location = attribute(:gcp_location, default: 'gcp_location', description: 'The GCP project region.')
regional_cluster = attribute('regional_cluster', default: {
  "name": "inspec-gcp-regional-cluster",
  "initial_node_count": 1
}, description: 'Regional container cluster definition')
control 'google_container_regional_clusters-1.0' do
  impact 1.0
  title 'google_container_regional_clusters resource test'

  describe google_container_regional_clusters(project: gcp_project_id, location: gcp_location) do
    its('count') { should be >= 1 }
    its('names') { should include regional_cluster['name'] }
    its('initial_node_counts') { should include regional_cluster['initial_node_count']}
  end
end
