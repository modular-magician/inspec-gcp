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

# A provider to manage Cloud KMS resources.
class KMSKeyRing < GcpResourceBase
  name 'google_kms_key_ring'
  desc 'KeyRing'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :name
  attr_reader :create_time
  attr_reader :key_ring_url
  attr_reader :location

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url, resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @name = @fetched['name']
    @create_time = parse_time_string(@fetched['createTime'])
    @key_ring_url = @fetched['name']
    @location = @fetched['location']
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "KeyRing #{@params[:name]}"
  end

  def key_ring_name
    name_from_self_link(@key_ring_url)
  end

  private

  def product_url
    'https://cloudkms.googleapis.com/v1/'
  end

  def resource_base_url
    'projects/{{project}}/locations/{{location}}/keyRings/{{name}}'
  end
end
