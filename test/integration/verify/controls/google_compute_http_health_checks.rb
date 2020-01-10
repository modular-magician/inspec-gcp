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

title 'Test GCP google_compute_http_health_checks resource.'

gcp_project_id = attribute(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
http_health_check = attribute('http_health_check', default: {
  "name": "inspec-gcp-http-health-check",
  "request_path": "/health_check",
  "timeout_sec": 20,
  "check_interval_sec": 20
}, description: 'HTTP health check definition')
control 'google_compute_http_health_checks-1.0' do
  impact 1.0
  title 'google_compute_http_health_checks resource test'

  describe google_compute_http_health_checks(project: gcp_project_id) do
    its('names') { should include http_health_check['name'] }
    its('timeout_secs') { should include http_health_check['timeout_sec'] }
    its('check_interval_secs') { should include http_health_check['check_interval_sec'] }
  end
end
