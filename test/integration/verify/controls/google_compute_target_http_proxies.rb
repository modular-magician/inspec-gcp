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

title 'Test GCP google_compute_target_http_proxies resource.'

gcp_project_id = attribute(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
http_proxy = attribute('http_proxy', default: {
  "name": "inspec-gcp-http-proxy",
  "description": "A HTTP proxy"
}, description: 'Compute HTTP proxy definition')
control 'google_compute_target_http_proxies-1.0' do
  impact 1.0
  title 'google_compute_target_http_proxies resource test'

  describe google_compute_target_http_proxies(project: gcp_project_id) do
    its('names') { should include http_proxy['name'] }
    its('descriptions') { should include http_proxy['description'] }
  end
end
