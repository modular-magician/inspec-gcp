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
require 'google/compute/property/healthcheck_http2_health_check'
require 'google/compute/property/healthcheck_http_health_check'
require 'google/compute/property/healthcheck_https_health_check'
require 'google/compute/property/healthcheck_log_config'
require 'google/compute/property/healthcheck_ssl_health_check'
require 'google/compute/property/healthcheck_tcp_health_check'

# A provider to manage Compute Engine resources.
class ComputeHealthCheck < GcpResourceBase
  name 'google_compute_health_check'
  desc 'HealthCheck'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :check_interval_sec
  attr_reader :creation_timestamp
  attr_reader :description
  attr_reader :healthy_threshold
  attr_reader :id
  attr_reader :name
  attr_reader :timeout_sec
  attr_reader :unhealthy_threshold
  attr_reader :type
  attr_reader :http_health_check
  attr_reader :https_health_check
  attr_reader :tcp_health_check
  attr_reader :ssl_health_check
  attr_reader :http2_health_check
  attr_reader :log_config

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @check_interval_sec = @fetched['checkIntervalSec']
    @creation_timestamp = parse_time_string(@fetched['creationTimestamp'])
    @description = @fetched['description']
    @healthy_threshold = @fetched['healthyThreshold']
    @id = @fetched['id']
    @name = @fetched['name']
    @timeout_sec = @fetched['timeoutSec']
    @unhealthy_threshold = @fetched['unhealthyThreshold']
    @type = @fetched['type']
    @http_health_check = GoogleInSpec::Compute::Property::HealthCheckHttpHealthCheck.new(@fetched['httpHealthCheck'], to_s)
    @https_health_check = GoogleInSpec::Compute::Property::HealthCheckHttpsHealthCheck.new(@fetched['httpsHealthCheck'], to_s)
    @tcp_health_check = GoogleInSpec::Compute::Property::HealthCheckTcpHealthCheck.new(@fetched['tcpHealthCheck'], to_s)
    @ssl_health_check = GoogleInSpec::Compute::Property::HealthCheckSslHealthCheck.new(@fetched['sslHealthCheck'], to_s)
    @http2_health_check = GoogleInSpec::Compute::Property::HealthCheckHttp2HealthCheck.new(@fetched['http2HealthCheck'], to_s)
    @log_config = GoogleInSpec::Compute::Property::HealthCheckLogConfig.new(@fetched['logConfig'], to_s)
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "HealthCheck #{@params[:name]}"
  end

  private

  def product_url(beta = false)
    if beta
      'https://compute.googleapis.com/compute/beta/'
    else
      'https://compute.googleapis.com/compute/v1/'
    end
  end

  def resource_base_url
    'projects/{{project}}/global/healthChecks/{{name}}'
  end
end
