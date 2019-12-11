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

title 'Test GCP google_dns_resource_record_sets resource.'

gcp_project_id = attribute(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
record_set = attribute('record_set', default: {
  "name": "backend.my.domain.com.",
  "type": "A",
  "ttl": 300,
  "rrdatas1": "8.8.8.8",
  "rrdatas2": "8.8.4.4"
})
managed_zone = attribute('managed_zone', default: {
  "name": "inspec-gcp-managed-zone",
  "dns_name": "my.domain.com.",
  "description": "A test DNS zone",
  "label_key": "key",
  "label_value": "value"
})
control 'google_dns_resource_record_sets-1.0' do
  impact 1.0
  title 'google_dns_resource_record_sets resource test'

  describe google_dns_resource_record_sets(project: gcp_project_id, name: record_set['name'], managed_zone: managed_zone['name']) do
    its('count') { should eq 3 }
    its('types') { should include record_set['type'] }
    its('ttls') { should include record_set['ttl'] }
    its('targets.flatten') { should include record_set['rrdatas1'] }
    its('targets.flatten') { should include record_set['rrdatas2'] }
  end
end
