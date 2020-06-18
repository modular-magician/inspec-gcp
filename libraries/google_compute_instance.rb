# frozen_string_literal: false

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
require 'gcp_backend'
require 'google/compute/property/instance_disks'
require 'google/compute/property/instance_guest_accelerators'
require 'google/compute/property/instance_network_interfaces'
require 'google/compute/property/instance_scheduling'
require 'google/compute/property/instance_service_accounts'
require 'google/compute/property/instance_shielded_instance_config'
require 'google/compute/property/instance_tags'

# A provider to manage Compute Engine resources.
class ComputeInstance < GcpResourceBase
  name 'google_compute_instance'
  desc 'Instance'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :can_ip_forward
  attr_reader :cpu_platform
  attr_reader :creation_timestamp
  attr_reader :deletion_protection
  attr_reader :disks
  attr_reader :guest_accelerators
  attr_reader :hostname
  attr_reader :id
  attr_reader :label_fingerprint
  attr_reader :labels
  attr_reader :metadata
  attr_reader :machine_type
  attr_reader :min_cpu_platform
  attr_reader :name
  attr_reader :network_interfaces
  attr_reader :scheduling
  attr_reader :service_accounts
  attr_reader :shielded_instance_config
  attr_reader :status
  attr_reader :status_message
  attr_reader :tags
  attr_reader :zone

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @can_ip_forward = @fetched['canIpForward']
    @cpu_platform = @fetched['cpuPlatform']
    @creation_timestamp = @fetched['creationTimestamp']
    @deletion_protection = @fetched['deletionProtection']
    @disks = GoogleInSpec::Compute::Property::InstanceDisksArray.parse(@fetched['disks'], to_s)
    @guest_accelerators = GoogleInSpec::Compute::Property::InstanceGuestAcceleratorsArray.parse(@fetched['guestAccelerators'], to_s)
    @hostname = @fetched['hostname']
    @id = @fetched['id']
    @label_fingerprint = @fetched['labelFingerprint']
    @labels = @fetched['labels']
    @metadata = @fetched['metadata']
    @machine_type = @fetched['machineType']
    @min_cpu_platform = @fetched['minCpuPlatform']
    @name = @fetched['name']
    @network_interfaces = GoogleInSpec::Compute::Property::InstanceNetworkInterfacesArray.parse(@fetched['networkInterfaces'], to_s)
    @scheduling = GoogleInSpec::Compute::Property::InstanceScheduling.new(@fetched['scheduling'], to_s)
    @service_accounts = GoogleInSpec::Compute::Property::InstanceServiceAccountsArray.parse(@fetched['serviceAccounts'], to_s)
    @shielded_instance_config = GoogleInSpec::Compute::Property::InstanceShieldedInstanceConfig.new(@fetched['shieldedInstanceConfig'], to_s)
    @status = @fetched['status']
    @status_message = @fetched['statusMessage']
    @tags = GoogleInSpec::Compute::Property::InstanceTags.new(@fetched['tags'], to_s)
    @zone = @fetched['zone']
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "Instance #{@params[:name]}"
  end

  def disk_count
    @disks&.count || 0
  end

  def tag_count
    @tags&.items&.count || 0
  end

  def network_interfaces_count
    @network_interfaces&.count || 0
  end

  # TBD: Below few methods are present to make the tests simpler e.g. avoid looping over arrays etc.
  #     but passing index arguments from the inspec test would be better

  def first_network_interface_nat_ip_exists
    !@network_interfaces[0].access_configs[0].nat_ip.nil?
  end

  def first_network_interface_name
    @network_interfaces[0].access_configs[0].name
  end

  def first_network_interface_type
    @network_interfaces[0].access_configs[0].type.downcase
  end

  def first_disks_source_name
    disks_source_name(0)
  end

  def first_disks_first_license
    disks_license(0, 0)
  end

  def second_disks_device_name
    return '' if @disks[1].nil? || !defined?(@disks[1].device_name) || @disks[1].device_name.nil?
    disks[1].device_name
  end

  def second_disks_source_name
    disks_source_name(1)
  end

  def second_disks_first_license
    disks_license(1, 0)
  end

  # helper method for retrieving a disk source basename
  def disks_source_name(index = 0)
    return '' if @disks[index].nil? || !defined?(@disks[index].source) || @disks[index].source.nil?
    @disks[index].source.split('/').last
  end

  # helper method for retrieving a disk license string
  def disks_license(disk_index = 0, license_index = 0)
    return '' if @disks[disk_index].nil? || !defined?(@disks[disk_index].licenses[license_index]) || @disks[disk_index].licenses[license_index].nil?
    @disks[disk_index].licenses[license_index].downcase
  end

  def machine_size
    return '' if !defined?(@machine_type) || @machine_type.nil?
    @machine_type.split('/').last
  end

  # helper for returning label keys to perform checks
  def labels_keys
    return [] if !defined?(@labels) || @labels.nil?
    @labels.keys
  end

  # helper for returning label values to perform checks
  def labels_values
    return [] if !defined?(@labels) || @labels.nil?
    @labels.values
  end

  def label_value_by_key(label_key)
    return [] if !defined?(@labels) || @labels.nil?
    @labels[label_key]
  end

  def metadata_keys
    return [] if !defined?(@metadata) || @metadata.nil?
    @metadata['items']&.map { |m| m['key'] }
  end

  def metadata_values
    return [] if !defined?(@metadata) || @metadata.nil?
    @metadata['items']&.map { |m| m['value'] }
  end

  def metadata_value_by_key(metadata_key)
    return [] if !defined?(@metadata) || @metadata.nil?
    @metadata['items']&.each do |item|
      if item['key'] == metadata_key
        return item['value']
      end
    end
    []
  end

  def service_account_scopes
    # note instances can have only one service account defined
    return [] if @service_accounts[0].nil? || !defined?(@service_accounts[0].scopes) || @service_accounts[0].scopes.nil?
    @service_accounts[0].scopes
  end

  def block_project_ssh_keys
    return false if !defined?(@metadata['items']) || @metadata['items'].nil?
    @metadata['items'].each do |element|
      return true if element.key=='block-project-ssh-keys' and element.value.casecmp('true').zero?
      return true if element.key=='block-project-ssh-keys' and element.value=='1'
    end
    false
  end

  def has_serial_port_disabled?
    return false if !defined?(@metadata['items']) || @metadata['items'].nil?
    @metadata['items'].each do |element|
      return true if element.key=='serial-port-enable' and element.value.casecmp('false').zero?
      return true if element.key=='serial-port-enable' and element.value=='0'
    end
    false
  end

  def has_disks_encrypted_with_csek?
    return false if !defined?(@disks) || @disks.nil?
    @disks.each do |disk|
      return false if !defined?(disk.disk_encryption_key)
      return false if disk.disk_encryption_key.nil?
      return false if !defined?(disk.disk_encryption_key.sha256)
      return false if disk.disk_encryption_key.sha256.nil?
    end
    true
  end

  private

  def product_url(beta = false)
    if beta
      'https://www.googleapis.com/compute/beta/'
    else
      'https://www.googleapis.com/compute/v1/'
    end
  end

  def resource_base_url
    'projects/{{project}}/zones/{{zone}}/instances/{{name}}'
  end
end
