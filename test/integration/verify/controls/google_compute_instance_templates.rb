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

title 'Test GCP google_compute_instance_templates resource.'

gcp_project_id = attribute(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
instance_template = attribute('instance_template', default: {
  "name": "inspec-gcp-instance-template",
  "description": "A description of the instance template",
  "instance_description": "A description of the instance itself",
  "machine_type": "f1-micro",
  "tag": "foo",
  "can_ip_forward": false,
  "scheduling_automatic_restart": true,
  "scheduling_on_host_maintenance": "MIGRATE",
  "disk_source_image": "debian-cloud/debian-9",
  "disk_auto_delete": true,
  "disk_boot": true,
  "network_interface_network": "default",
  "service_account_scope": "storage-ro"
}, description: 'An instance template definition')
control 'google_compute_instance_templates-1.0' do
  impact 1.0
  title 'google_compute_instance_templates resource test'

  describe google_compute_instance_templates(project: gcp_project_id) do
    its('names') { should include instance_template['name'] }
  end
end
