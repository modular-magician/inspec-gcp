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

title 'Test GCP google_compute_target_tcp_proxies resource.'

gcp_project_id = attribute(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
target_tcp_proxy = attribute('target_tcp_proxy', default: {
  "name": "inspec-gcp-target-tcp-proxy",
  "proxy_header": "NONE",
  "tcp_backend_service_name": "gcp-inspec-tcp-backend-service"
}, description: 'Compute TCP proxy definition')
control 'google_compute_target_tcp_proxies-1.0' do
  impact 1.0
  title 'google_compute_target_tcp_proxies resource test'

  describe google_compute_target_tcp_proxies(project: gcp_project_id) do
    its('names') { should include target_tcp_proxy['name'] }
    its('proxy_headers') { should include target_tcp_proxy['proxy_header'] }
  end
end
