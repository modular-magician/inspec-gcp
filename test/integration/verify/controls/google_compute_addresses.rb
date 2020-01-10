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

title 'Test GCP google_compute_addresses resource.'

gcp_project_id = attribute(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
gcp_location = attribute(:gcp_location, default: 'gcp_location', description: 'The GCP project region.')
address = attribute('address', default: {
  "name": "inspec-gcp-global-address",
  "address_type": "INTERNAL",
  "address": "10.2.0.3"
}, description: 'Address definition')
control 'google_compute_addresses-1.0' do
  impact 1.0
  title 'google_compute_addresses resource test'

  describe google_compute_addresses(project: gcp_project_id, location: gcp_location) do
    its('addresses') { should include address['address'] }
    its('names') { should include address['name'] }
  end
end
