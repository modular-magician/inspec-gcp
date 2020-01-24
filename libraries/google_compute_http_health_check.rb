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
class ComputeHttpHealthCheck < GcpResourceBase
  name 'google_compute_http_health_check'
  desc 'HttpHealthCheck'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :check_interval_sec
  attr_reader :creation_timestamp
  attr_reader :description
  attr_reader :healthy_threshold
  attr_reader :host
  attr_reader :id
  attr_reader :name
  attr_reader :port
  attr_reader :request_path
  attr_reader :timeout_sec
  attr_reader :unhealthy_threshold

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url, resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @check_interval_sec = @fetched['checkIntervalSec']
    @creation_timestamp = parse_time_string(@fetched['creationTimestamp'])
    @description = @fetched['description']
    @healthy_threshold = @fetched['healthyThreshold']
    @host = @fetched['host']
    @id = @fetched['id']
    @name = @fetched['name']
    @port = @fetched['port']
    @request_path = @fetched['requestPath']
    @timeout_sec = @fetched['timeoutSec']
    @unhealthy_threshold = @fetched['unhealthyThreshold']
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "HttpHealthCheck #{@params[:name]}"
  end

  private

  def product_url
    'https://www.googleapis.com/compute/v1/'
  end

  def resource_base_url
    'projects/{{project}}/global/httpHealthChecks/{{name}}'
  end
end
