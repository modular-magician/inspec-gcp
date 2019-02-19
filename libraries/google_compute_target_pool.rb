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

# A provider to manage Google Compute Engine resources.
class TargetPool < GcpResourceBase
  name 'google_compute_target_pool'
  desc 'TargetPool'
  supports platform: 'gcp'

  attr_reader :backup_pool
  attr_reader :creation_timestamp
  attr_reader :description
  attr_reader :failover_ratio
  attr_reader :health_check
  attr_reader :id
  attr_reader :instances
  attr_reader :name
  attr_reader :session_affinity
  attr_reader :region

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @fetched = @connection.fetch(_base, _url, params)
    parse unless @fetched.nil?
  end

  def parse
    @backup_pool = @fetched['backupPool']
    @creation_timestamp = parse_time_string(@fetched['creationTimestamp'])
    @description = @fetched['description']
    @failover_ratio = @fetched['failoverRatio']
    @health_check = @fetched['healthCheck']
    @id = @fetched['id']
    @instances = @fetched['instances']
    @name = @fetched['name']
    @session_affinity = @fetched['sessionAffinity']
    @region = @fetched['region']
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  RSpec::Matchers.alias_matcher :has_target_instance, :be_has_target_instance

  def has_target_instance?(name, zone)
    instances.any? { |instance_self_link| instance_self_link.end_with?("zones/#{zone}/instances/#{name}") }
  end

  private

  def _base
    'https://www.googleapis.com/compute/v1/'
  end

  def _url
    'projects/{{project}}/regions/{{region}}/targetPools/{{name}}'
  end
end
