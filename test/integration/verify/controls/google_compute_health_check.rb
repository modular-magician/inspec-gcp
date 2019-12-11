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

title 'Test GCP google_compute_health_check resource.'

gcp_project_id = attribute(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
health_check = attribute('health_check', default: {
  "name": "inspec-gcp-health-check",
  "timeout_sec": 10,
  "check_interval_sec": 10,
  "tcp_health_check_port": 80
}, description: 'Health check definition')
control 'google_compute_health_check-1.0' do
  impact 1.0
  title 'google_compute_health_check resource test'

  describe google_compute_health_check(project: gcp_project_id, name: health_check['name']) do
    it { should exist }
    its('timeout_sec') { should eq health_check['timeout_sec'] }
    its('tcp_health_check.port') { should eq health_check['tcp_health_check_port'] }
  end

  describe google_compute_health_check(project: gcp_project_id, name: 'nonexistent') do
    it { should_not exist }
  end
end
