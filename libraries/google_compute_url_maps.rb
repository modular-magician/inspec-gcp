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
class ComputeUrlMaps < GcpResourceBase
  name 'google_compute_url_maps'
  desc 'UrlMap plural resource'
  supports platform: 'gcp'

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:creation_timestamps, field: :creation_timestamp)
  filter_table_config.add(:default_services, field: :default_service)
  filter_table_config.add(:descriptions, field: :description)
  filter_table_config.add(:ids, field: :id)
  filter_table_config.add(:fingerprints, field: :fingerprint)
  filter_table_config.add(:header_actions, field: :header_action)
  filter_table_config.add(:host_rules, field: :host_rules)
  filter_table_config.add(:names, field: :name)
  filter_table_config.add(:path_matchers, field: :path_matchers)
  filter_table_config.add(:tests, field: :tests)

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
      'creationTimestamp' => ->(obj) { return :creation_timestamp, parse_time_string(obj['creationTimestamp']) },
      'defaultService' => ->(obj) { return :default_service, obj['defaultService'] },
      'description' => ->(obj) { return :description, obj['description'] },
      'id' => ->(obj) { return :id, obj['id'] },
      'fingerprint' => ->(obj) { return :fingerprint, obj['fingerprint'] },
      'headerAction' => ->(obj) { return :header_action, GoogleInSpec::Compute::Property::UrlMapHeaderAction.new(obj['headerAction'], to_s) },
      'hostRules' => ->(obj) { return :host_rules, GoogleInSpec::Compute::Property::UrlMapHostRulesArray.parse(obj['hostRules'], to_s) },
      'name' => ->(obj) { return :name, obj['name'] },
      'pathMatchers' => ->(obj) { return :path_matchers, GoogleInSpec::Compute::Property::UrlMapPathMatchersArray.parse(obj['pathMatchers'], to_s) },
      'tests' => ->(obj) { return :tests, GoogleInSpec::Compute::Property::UrlMapTestsArray.parse(obj['tests'], to_s) },
    }
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
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
    'projects/{{project}}/global/urlMaps'
  end
end
