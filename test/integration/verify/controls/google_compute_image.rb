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

title 'Test GCP google_compute_image resource.'

gcp_project_id = attribute(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
compute_image = attribute('compute_image', default: {
  "name": "inspec-image",
  "source": "https://storage.googleapis.com/bosh-cpi-artifacts/bosh-stemcell-3262.4-google-kvm-ubuntu-trusty-go_agent-raw.tar.gz"
}, description: 'Compute image description')
control 'google_compute_image-1.0' do
  impact 1.0
  title 'google_compute_image resource test'

  describe google_compute_image(project: gcp_project_id, name: compute_image['name']) do
    it { should exist }
    its('disk_size_gb') { should cmp 3 }
  end

  describe google_compute_image(project: gcp_project_id, name: 'notfound') do
    it { should_not exist }
  end
end
