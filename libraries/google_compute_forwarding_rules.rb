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
class ComputeForwardingRules < GcpResourceBase
  name 'google_compute_forwarding_rules'
  desc 'ForwardingRule plural resource'
  supports platform: 'gcp'

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:creation_timestamps, field: :creation_timestamp)
  filter_table_config.add(:descriptions, field: :description)
  filter_table_config.add(:forwarding_rule_ids, field: :forwarding_rule_id)
  filter_table_config.add(:ip_addresses, field: :ip_address)
  filter_table_config.add(:ip_protocols, field: :ip_protocol)
  filter_table_config.add(:backend_services, field: :backend_service)
  filter_table_config.add(:forwarding_rule_load_balancing_schemes, field: :forwarding_rule_load_balancing_scheme)
  filter_table_config.add(:forwarding_rule_names, field: :forwarding_rule_name)
  filter_table_config.add(:forwarding_rule_networks, field: :forwarding_rule_network)
  filter_table_config.add(:port_ranges, field: :port_range)
  filter_table_config.add(:ports, field: :ports)
  filter_table_config.add(:subnetworks, field: :subnetwork)
  filter_table_config.add(:targets, field: :target)
  filter_table_config.add(:all_ports, field: :all_ports)
  filter_table_config.add(:network_tiers, field: :network_tier)
  filter_table_config.add(:service_labels, field: :service_label)
  filter_table_config.add(:service_names, field: :service_name)
  filter_table_config.add(:regions, field: :region)

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
      'description' => ->(obj) { return :description, obj['description'] },
      'id' => ->(obj) { return :forwarding_rule_id, obj['id'] },
      'IPAddress' => ->(obj) { return :ip_address, obj['IPAddress'] },
      'IPProtocol' => ->(obj) { return :ip_protocol, obj['IPProtocol'] },
      'backendService' => ->(obj) { return :backend_service, obj['backendService'] },
      'loadBalancingScheme' => ->(obj) { return :forwarding_rule_load_balancing_scheme, obj['loadBalancingScheme'] },
      'name' => ->(obj) { return :forwarding_rule_name, obj['name'] },
      'network' => ->(obj) { return :forwarding_rule_network, name_from_self_link(obj['network']) },
      'portRange' => ->(obj) { return :port_range, obj['portRange'] },
      'ports' => ->(obj) { return :ports, obj['ports'] },
      'subnetwork' => ->(obj) { return :subnetwork, obj['subnetwork'] },
      'target' => ->(obj) { return :target, obj['target'] },
      'allPorts' => ->(obj) { return :all_ports, obj['allPorts'] },
      'networkTier' => ->(obj) { return :network_tier, obj['networkTier'] },
      'serviceLabel' => ->(obj) { return :service_label, obj['serviceLabel'] },
      'serviceName' => ->(obj) { return :service_name, obj['serviceName'] },
      'region' => ->(obj) { return :region, obj['region'] },
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
    'projects/{{project}}/regions/{{region}}/forwardingRules'
  end
end
