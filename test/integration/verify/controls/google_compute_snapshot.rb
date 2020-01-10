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

title 'Test GCP google_compute_snapshot resource.'

gcp_project_id = attribute(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
gcp_zone = attribute(:gcp_zone, default: 'gcp_zone', description: 'GCP zone name of the compute disk')
snapshot = attribute('snapshot', default: {
  "name": "inspec-gcp-disk-snapshot",
  "disk_name": "inspec-snapshot-disk",
  "disk_type": "pd-standard",
  "disk_image": "debian-cloud/debian-10-buster-v20191014"
}, description: 'Compute disk snapshot description')
control 'google_compute_snapshot-1.0' do
  impact 1.0
  title 'google_compute_snapshot resource test'


  describe google_compute_snapshot(project: gcp_project_id, name: snapshot['name']) do
    it { should exist }
    its('source_disk') { should match snapshot['disk_name'] }
  end

  describe google_compute_snapshot(project: gcp_project_id, name: 'nonexistent') do
    it { should_not exist }
  end
end
