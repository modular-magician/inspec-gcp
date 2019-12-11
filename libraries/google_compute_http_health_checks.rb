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
class ComputeHttpHealthChecks < GcpResourceBase
  name 'google_compute_http_health_checks'
  desc 'HttpHealthCheck plural resource'
  supports platform: 'gcp'

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:check_interval_secs, field: :check_interval_sec)
  filter_table_config.add(:creation_timestamps, field: :creation_timestamp)
  filter_table_config.add(:descriptions, field: :description)
  filter_table_config.add(:healthy_thresholds, field: :healthy_threshold)
  filter_table_config.add(:hosts, field: :host)
  filter_table_config.add(:ids, field: :id)
  filter_table_config.add(:names, field: :name)
  filter_table_config.add(:ports, field: :port)
  filter_table_config.add(:request_paths, field: :request_path)
  filter_table_config.add(:timeout_secs, field: :timeout_sec)
  filter_table_config.add(:unhealthy_thresholds, field: :unhealthy_threshold)

  filter_table_config.connect(self, :table)

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @table = fetch_wrapped_resource('items')
  end

  def fetch_wrapped_resource(wrap_path)
    # fetch_resource returns an array of responses (to handle pagination)
    result = @connection.fetch_all(product_url, resource_base_url, @params, 'Get')
    return if result.nil?

    # Conversion of string -> object hash to symbol -> object hash that InSpec needs
    converted = []
    result.each do |response|
      next if response.nil? || !response.key?(wrap_path)
      response[wrap_path].each do |hash|
        hash_with_symbols = {}
        hash.each_key do |key|
          name, value = transform(key, hash)
          hash_with_symbols[name] = value
        end
        converted.push(hash_with_symbols)
      end
    end

    converted
  end

  def transform(key, value)
    return transformers[key].call(value) if transformers.key?(key)

    [key.to_sym, value]
  end

  def transformers
    {
      'checkIntervalSec' => ->(obj) { return :check_interval_sec, obj['checkIntervalSec'] },
      'creationTimestamp' => ->(obj) { return :creation_timestamp, parse_time_string(obj['creationTimestamp']) },
      'description' => ->(obj) { return :description, obj['description'] },
      'healthyThreshold' => ->(obj) { return :healthy_threshold, obj['healthyThreshold'] },
      'host' => ->(obj) { return :host, obj['host'] },
      'id' => ->(obj) { return :id, obj['id'] },
      'name' => ->(obj) { return :name, obj['name'] },
      'port' => ->(obj) { return :port, obj['port'] },
      'requestPath' => ->(obj) { return :request_path, obj['requestPath'] },
      'timeoutSec' => ->(obj) { return :timeout_sec, obj['timeoutSec'] },
      'unhealthyThreshold' => ->(obj) { return :unhealthy_threshold, obj['unhealthyThreshold'] },
    }
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  private

  def product_url
    'https://www.googleapis.com/compute/v1/'
  end

  def resource_base_url
    'projects/{{project}}/global/httpHealthChecks'
  end
end
