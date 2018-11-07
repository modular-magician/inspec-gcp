# Copyright 2018 Google Inc.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

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

require 'inspec/resource'
class Networks < Inspec.resource(1)

  name 'google_compute_networks'
  desc 'Network plural resource'
  supports platform: 'gcp2'

  filter_table_config = FilterTable.create

  filter_table_config.add(:descriptions, field: :description)
  filter_table_config.add(:gateway_ipv4s, field: :gateway_ipv4)
  filter_table_config.add(:ids, field: :id)
  filter_table_config.add(:ipv4_ranges, field: :ipv4_range)
  filter_table_config.add(:names, field: :name)
  filter_table_config.add(:subnetworks, field: :subnetworks)
  filter_table_config.add(:auto_create_subnetworks, field: :autoCreateSubnetworks)
  filter_table_config.add(:creation_timestamps, field: :creationTimestamp)
  filter_table_config.add(:routing_configs, field: :routingConfig)

  filter_table_config.connect(self, :fetch_data)

  def base
    'https://www.googleapis.com/compute/v1/'
  end

  def url
    'projects/{{project}}/global/networks'
  end

  def initialize(params = {}) 
    @params = params
  end

  def fetch_resource(params)
    inspec.backend.fetch_all(base, url, params)
  end

  def fetch_data
  	@data = fetch_wrapped_resource('compute#networkList', 'items')
  end

  def fetch_wrapped_resource(wrap_kind, wrap_path)
    # fetch_resource returns an array of responses (to handle pagination)
    result = fetch_resource(@params)
    return if result.nil?

    # Conversion of string -> object hash to symbol -> object hash that InSpec needs
    converted = []
    result.each do |response|
      return if response.nil? || !response.key?(wrap_path)
      response[wrap_path].each do |hash|
        hash_with_symbols = {}
        hash.each_pair { |k, v| hash_with_symbols[k.to_sym] = v }
        converted.push(hash_with_symbols)
      end
    end

    converted
  end

end
