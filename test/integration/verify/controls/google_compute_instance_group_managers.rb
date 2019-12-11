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

title 'Test GCP google_compute_instance_group_managers resource.'

gcp_project_id = attribute(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
gcp_zone = attribute(:gcp_zone, default: 'gcp_zone', description: 'The GCP project zone.')
instance_group_manager = attribute('instance_group_manager', default: {
  "name": "inspec-gcp-igm",
  "base_instance_name": "igm",
  "named_port_name": "port",
  "named_port_port": 80
}, description: 'Instance group manager definition')
control 'google_compute_instance_group_managers-1.0' do
  impact 1.0
  title 'google_compute_instance_group_managers resource test'

  describe google_compute_instance_group_managers(project: gcp_project_id, zone: gcp_zone) do
    its('base_instance_names') { should include instance_group_manager['base_instance_name'] }
  end
end
