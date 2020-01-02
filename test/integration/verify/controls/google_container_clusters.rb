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

title 'Test GCP google_container_clusters resource.'

gcp_project_id = attribute(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
gcp_kube_cluster_name = attribute(:gcp_kube_cluster_name, default: 'gcp_kube_cluster_name', description: 'GCP container cluster name')
gcp_kube_cluster_zone = attribute(:gcp_kube_cluster_zone, default: 'gcp_kube_cluster_zone', description: 'GCP container cluster zone')
gcp_kube_cluster_size = attribute(:gcp_kube_cluster_size, default: 'gcp_kube_cluster_size', description: 'GCP container cluster size')
gcp_kube_cluster_zone_extra1 = attribute(:gcp_kube_cluster_zone_extra1, default: 'gcp_kube_cluster_zone_extra1', description: 'First extra zone for the cluster')
gcp_kube_cluster_zone_extra2 = attribute(:gcp_kube_cluster_zone_extra2, default: 'gcp_kube_cluster_zone_extra2', description: 'Second extra zone for the cluster')
gcp_kube_cluster_master_user = attribute(:gcp_kube_cluster_master_user, default: 'gcp_kube_cluster_master_user', description: 'GCP container cluster admin username')
gcp_kube_cluster_master_pass = attribute(:gcp_kube_cluster_master_pass, default: 'gcp_kube_cluster_master_pass', description: 'GCP container cluster admin password')
control 'google_container_clusters-1.0' do
  impact 1.0
  title 'google_container_clusters resource test'

  describe google_container_clusters(project: gcp_project_id, location: gcp_kube_cluster_zone) do
    its('cluster_names') { should include gcp_kube_cluster_name }
  end
end