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
#     Nathan is editing this to generate diffs in lots of files.
#     He won't submit this change.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------
require 'gcp_backend'

# A provider to manage Cloud Memorystore resources.
class RedisInstance < GcpResourceBase
  name 'google_redis_instance'
  desc 'Instance'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :alternative_location_id
  attr_reader :authorized_network
  attr_reader :create_time
  attr_reader :current_location_id
  attr_reader :display_name
  attr_reader :host
  attr_reader :labels
  attr_reader :redis_configs
  attr_reader :location_id
  attr_reader :name
  attr_reader :memory_size_gb
  attr_reader :port
  attr_reader :redis_version
  attr_reader :reserved_ip_range
  attr_reader :tier
  attr_reader :region

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url, resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @alternative_location_id = @fetched['alternativeLocationId']
    @authorized_network = @fetched['authorizedNetwork']
    @create_time = parse_time_string(@fetched['createTime'])
    @current_location_id = @fetched['currentLocationId']
    @display_name = @fetched['displayName']
    @host = @fetched['host']
    @labels = @fetched['labels']
    @redis_configs = @fetched['redisConfigs']
    @location_id = @fetched['locationId']
    @name = @fetched['name']
    @memory_size_gb = @fetched['memorySizeGb']
    @port = @fetched['port']
    @redis_version = @fetched['redisVersion']
    @reserved_ip_range = @fetched['reservedIpRange']
    @tier = @fetched['tier']
    @region = @fetched['region']
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "Instance #{@params[:name]}"
  end

  private

  def product_url
    'https://redis.googleapis.com/v1/'
  end

  def resource_base_url
    'projects/{{project}}/locations/{{region}}/instances/{{name}}'
  end
end
