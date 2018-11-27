# Copyright 2017 Google Inc.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
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

require 'vcr_config'

title 'Test GCP google_compute_ssl_policies resource.'
project_name = attribute('project_name', default: 'graphite-test-sam-chef')
ssl_policy = attribute('ssl_policy', default: {"name"=>"inspec-gcp-ssl-policy", "min_tls_version"=>"TLS_1_2", "profile"=>"CUSTOM", "custom_feature"=>"TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384", "custom_feature2"=>"TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384"})


control 'google_compute_ssl_policies-1.0' do
  impact 1.0
  title 'google_compute_ssl_policies resource test'

  VCR.use_cassette('google_compute_ssl_policies') do
    resource = google_compute_ssl_policies({project: project_name})
    describe resource do
      it { should exist }
      its('names') { should include ssl_policy['name'] }
      its('profiles') { should include ssl_policy['profile'] }
    end	
	end
end
