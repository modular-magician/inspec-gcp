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
require 'google/pubsub/property/topic_message_storage_policy'

# A provider to manage Cloud Pub/Sub resources.
class PubsubTopic < GcpResourceBase
  name 'google_pubsub_topic'
  desc 'Topic'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :name
  attr_reader :kms_key_name
  attr_reader :labels
  attr_reader :message_storage_policy

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url, resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @name = name_from_self_link(@fetched['name'])
    @kms_key_name = @fetched['kmsKeyName']
    @labels = @fetched['labels']
    @message_storage_policy = GoogleInSpec::Pubsub::Property::TopicMessageStoragePolicy.new(@fetched['messageStoragePolicy'], to_s)
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "Topic #{@params[:name]}"
  end

  private

  def product_url
    'https://pubsub.googleapis.com/v1/'
  end

  def resource_base_url
    'projects/{{project}}/topics/{{name}}'
  end
end
