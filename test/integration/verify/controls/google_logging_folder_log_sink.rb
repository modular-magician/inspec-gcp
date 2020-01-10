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

title 'Test GCP google_logging_folder_log_sink resource.'

folder_sink = attribute('folder_sink', default: {"name"=>"inspec-gcp-folder-sink", "filter"=>"resource.type = gce_instance AND severity >= ERROR"})
gcp_organization_id = attribute(:gcp_organization_id, default: gcp_organization_id, description: 'The identifier of the organization that is the parent of the folder')
gcp_enable_privileged_resources = attribute(:gcp_enable_privileged_resources, default:0, description:'Flag to enable privileged resources requiring elevated privileges in GCP.')
control 'google_logging_folder_log_sink-1.0' do
  impact 1.0
  title 'google_logging_folder_log_sink resource test'

  only_if { gcp_enable_privileged_resources.to_i == 1 }
  # Getting folder sinks is complicated due to the name being generated by the server.
  # This can be drastically simplified if you have the folder name when writing the test
  describe.one do
    google_resourcemanager_folders(parent: "organizations/#{gcp_organization_id}").names.each do |folder_name|
      # name on a folder is in the form `folders/12345`
      describe google_logging_folder_log_sink(folder: folder_name.split('/')[1], name: folder_sink['name']) do
        it { should exist }
        its('filter') { should cmp folder_sink['filter'] }
      end
    end
  end
end
