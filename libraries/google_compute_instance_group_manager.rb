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
require 'google/compute/property/instancegroupmanager_current_actions'
require 'google/compute/property/instancegroupmanager_named_ports'

# A provider to manage Google Compute Engine resources.
class InstanceGroupManager < GcpResourceBase
  name 'google_compute_instance_group_manager'
  desc 'InstanceGroupManager'
  supports platform: 'gcp'

  attr_reader :base_instance_name
  attr_reader :creation_timestamp
  attr_reader :current_actions
  attr_reader :description
  attr_reader :id
  attr_reader :instance_group
  attr_reader :instance_template
  attr_reader :name
  attr_reader :named_ports
  attr_reader :region
  attr_reader :target_pools
  attr_reader :target_size
  attr_reader :zone

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @fetched = @connection.fetch(_base, _url, params)
    parse unless @fetched.nil?
  end

  def parse
    @base_instance_name = @fetched['baseInstanceName']
    @creation_timestamp = parse_time_string(@fetched['creationTimestamp'])
    @current_actions = GoogleInSpec::Compute::Property::InstanceGroupManagerCurrentActions.new(@fetched['currentActions'])
    @description = @fetched['description']
    @id = @fetched['id']
    @instance_group = @fetched['instanceGroup']
    @instance_template = @fetched['instanceTemplate']
    @name = @fetched['name']
    @named_ports = GoogleInSpec::Compute::Property::InstanceGroupManagerNamedPortsArray.parse(@fetched['namedPorts'])
    @region = @fetched['region']
    @target_pools = @fetched['targetPools']
    @target_size = @fetched['targetSize']
    @zone = @fetched['zone']
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  private

  def _base
    'https://www.googleapis.com/compute/v1/'
  end

  def _url
    'projects/{{project}}/zones/{{zone}}/instanceGroupManagers/{{name}}'
  end
end
