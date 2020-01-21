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

# A provider to manage Compute Engine resources.
class ComputeNetworkEndpointGroup < GcpResourceBase
  name 'google_compute_network_endpoint_group'
  desc 'NetworkEndpointGroup'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :id
  attr_reader :name
  attr_reader :description
  attr_reader :network_endpoint_type
  attr_reader :size
  attr_reader :network
  attr_reader :subnetwork
  attr_reader :default_port
  attr_reader :zone

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @id = @fetched['id']
    @name = @fetched['name']
    @description = @fetched['description']
    @network_endpoint_type = @fetched['networkEndpointType']
    @size = @fetched['size']
    @network = @fetched['network']
    @subnetwork = @fetched['subnetwork']
    @default_port = @fetched['defaultPort']
    @zone = @fetched['zone']
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "NetworkEndpointGroup #{@params[:name]}"
  end

  private

  def product_url(_ = nil)
    'https://www.googleapis.com/compute/v1/'
  end

  def resource_base_url
    'projects/{{project}}/zones/{{zone}}/networkEndpointGroups/{{name}}'
  end
end
