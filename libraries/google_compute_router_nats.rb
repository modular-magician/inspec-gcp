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
class ComputeRouterNats < GcpResourceBase
  name 'google_compute_router_nats'
  desc 'RouterNat plural resource'
  supports platform: 'gcp'

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:names, field: :name)
  filter_table_config.add(:nat_ip_allocate_options, field: :nat_ip_allocate_option)
  filter_table_config.add(:nat_ips, field: :nat_ips)
  filter_table_config.add(:drain_nat_ips, field: :drain_nat_ips)
  filter_table_config.add(:source_subnetwork_ip_ranges_to_nats, field: :source_subnetwork_ip_ranges_to_nat)
  filter_table_config.add(:subnetworks, field: :subnetwork)
  filter_table_config.add(:min_ports_per_vms, field: :min_ports_per_vm)
  filter_table_config.add(:udp_idle_timeout_secs, field: :udp_idle_timeout_sec)
  filter_table_config.add(:icmp_idle_timeout_secs, field: :icmp_idle_timeout_sec)
  filter_table_config.add(:tcp_established_idle_timeout_secs, field: :tcp_established_idle_timeout_sec)
  filter_table_config.add(:tcp_transitory_idle_timeout_secs, field: :tcp_transitory_idle_timeout_sec)
  filter_table_config.add(:log_configs, field: :log_config)
  filter_table_config.add(:routers, field: :router)
  filter_table_config.add(:regions, field: :region)

  filter_table_config.connect(self, :table)

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @table = fetch_wrapped_resource('nats')
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
      'name' => ->(obj) { return :name, obj['name'] },
      'natIpAllocateOption' => ->(obj) { return :nat_ip_allocate_option, obj['natIpAllocateOption'] },
      'natIps' => ->(obj) { return :nat_ips, obj['natIps'] },
      'drainNatIps' => ->(obj) { return :drain_nat_ips, obj['drainNatIps'] },
      'sourceSubnetworkIpRangesToNat' => ->(obj) { return :source_subnetwork_ip_ranges_to_nat, obj['sourceSubnetworkIpRangesToNat'] },
      'subnetworks' => ->(obj) { return :subnetwork, GoogleInSpec::Compute::Property::RouterNatSubnetworkArray.parse(obj['subnetworks'], to_s) },
      'minPortsPerVm' => ->(obj) { return :min_ports_per_vm, obj['minPortsPerVm'] },
      'udpIdleTimeoutSec' => ->(obj) { return :udp_idle_timeout_sec, obj['udpIdleTimeoutSec'] },
      'icmpIdleTimeoutSec' => ->(obj) { return :icmp_idle_timeout_sec, obj['icmpIdleTimeoutSec'] },
      'tcpEstablishedIdleTimeoutSec' => ->(obj) { return :tcp_established_idle_timeout_sec, obj['tcpEstablishedIdleTimeoutSec'] },
      'tcpTransitoryIdleTimeoutSec' => ->(obj) { return :tcp_transitory_idle_timeout_sec, obj['tcpTransitoryIdleTimeoutSec'] },
      'logConfig' => ->(obj) { return :log_config, GoogleInSpec::Compute::Property::RouterNatLogConfig.new(obj['logConfig'], to_s) },
      'router' => ->(obj) { return :router, obj['router'] },
      'region' => ->(obj) { return :region, obj['region'] },
    }
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
    'projects/{{project}}/regions/{{region}}/routers/{{router}}'
  end
end
