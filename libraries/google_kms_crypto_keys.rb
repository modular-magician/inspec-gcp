# frozen_string_literal: false

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
#     ***     DIFF TEST DIFF TEST    ***
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
class KMSCryptoKeys < GcpResourceBase
  name 'google_kms_crypto_keys'
  desc 'CryptoKey plural resource'
  supports platform: 'gcp'

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:crypto_key_names, field: :crypto_key_name)
  filter_table_config.add(:create_times, field: :create_time)
  filter_table_config.add(:labels, field: :labels)
  filter_table_config.add(:purposes, field: :purpose)
  filter_table_config.add(:rotation_periods, field: :rotation_period)
  filter_table_config.add(:version_templates, field: :version_template)
  filter_table_config.add(:next_rotation_times, field: :next_rotation_time)
  filter_table_config.add(:key_rings, field: :key_ring)

  filter_table_config.connect(self, :table)

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @table = fetch_wrapped_resource('cryptoKeys')
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
      'name' => ->(obj) { return :crypto_key_name, name_from_self_link(obj['name']) },
      'createTime' => ->(obj) { return :create_time, parse_time_string(obj['createTime']) },
      'labels' => ->(obj) { return :labels, obj['labels'] },
      'purpose' => ->(obj) { return :purpose, obj['purpose'] },
      'rotationPeriod' => ->(obj) { return :rotation_period, obj['rotationPeriod'] },
      'versionTemplate' => ->(obj) { return :version_template, GoogleInSpec::KMS::Property::CryptoKeyVersionTemplate.new(obj['versionTemplate'], to_s) },
      'nextRotationTime' => ->(obj) { return :next_rotation_time, parse_time_string(obj['nextRotationTime']) },
      'keyRing' => ->(obj) { return :key_ring, obj['keyRing'] },
    }
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  private

  def product_url
    'https://cloudkms.googleapis.com/v1/'
  end

  def resource_base_url
    'projects/{{project}}/locations/{{location}}/keyRings/{{key_ring_name}}/cryptoKeys'
  end
end
