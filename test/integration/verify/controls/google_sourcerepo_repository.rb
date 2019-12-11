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

title 'Test GCP google_sourcerepo_repository resource.'

gcp_project_id = attribute(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
repository = attribute('repository', default: {
  "name": "inspec-gcp-repository"
}, description: 'Source Repository definition')
control 'google_sourcerepo_repository-1.0' do
  impact 1.0
  title 'google_sourcerepo_repository resource test'

  describe google_sourcerepo_repository(project: gcp_project_id, name: repository['name']) do
    it { should exist }
  end

  describe google_sourcerepo_repository(project: gcp_project_id, name: 'nonexistent') do
    it { should_not exist }
  end
end
