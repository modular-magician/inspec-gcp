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

title 'Test GCP google_appengine_standard_app_version resource.'

gcp_project_id = attribute(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
gcp_location = attribute(:gcp_location, default: 'gcp_location', description: 'The GCP project location.')
standardappversion = attribute('standardappversion', default: {
  "version_id": "v2",
  "service": "default",
  "runtime": "nodejs10",
  "entrypoint": "node ./app.js",
  "port": "8080"
}, description: 'Cloud App Engine definition')
control 'google_appengine_standard_app_version-1.0' do
  impact 1.0
  title 'google_appengine_standard_app_version resource test'


  describe google_appengine_standard_app_version(project: gcp_project_id, location: gcp_location, version_id: standardappversion['version_id'], service: standardappversion['service']) do
    it { should exist }
    its('version_id') { should eq standardappversion['version_id'] }
    its('runtime') { should eq standardappversion['runtime'] }
  end
end
