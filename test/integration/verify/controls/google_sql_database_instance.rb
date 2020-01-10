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

title 'Test GCP google_sql_database_instance resource.'

gcp_project_id = attribute(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
gcp_location = attribute(:gcp_location, default: 'gcp_location', description: 'The GCP project location.')
gcp_db_instance_name = attribute(:gcp_db_instance_name, default: 'gcp_db_instance_name', description: 'Database instance name.')
control 'google_sql_database_instance-1.0' do
  impact 1.0
  title 'google_sql_database_instance resource test'


  describe google_sql_database_instance(project: gcp_project_id, database: gcp_db_instance_name) do
    it { should exist }
    its('state') { should eq 'RUNNABLE' }
    its('backend_type') { should eq 'SECOND_GEN' }
    its('database_version') { should eq 'MYSQL_5_7' }
  end
end
