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
class StorageBucketObjects < GcpResourceBase
  name 'google_storage_bucket_objects'
  desc 'BucketObject plural resource'
  supports platform: 'gcp'

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:object_buckets, field: :object_bucket)
  filter_table_config.add(:objects, field: :object)
  filter_table_config.add(:content_types, field: :content_type)
  filter_table_config.add(:crc32cs, field: :crc32c)
  filter_table_config.add(:etags, field: :etag)
  filter_table_config.add(:generations, field: :generation)
  filter_table_config.add(:ids, field: :id)
  filter_table_config.add(:md5_hashes, field: :md5_hash)
  filter_table_config.add(:media_links, field: :media_link)
  filter_table_config.add(:metagenerations, field: :metageneration)
  filter_table_config.add(:object_names, field: :object_name)
  filter_table_config.add(:sizes, field: :size)
  filter_table_config.add(:storage_classes, field: :storage_class)
  filter_table_config.add(:object_created_times, field: :object_created_times)
  filter_table_config.add(:time_deleteds, field: :time_deleted)
  filter_table_config.add(:time_storage_class_updateds, field: :time_storage_class_updated)
  filter_table_config.add(:time_updateds, field: :time_updated)

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
      'bucket' => ->(obj) { return :object_bucket, obj['bucket'] },
      'object' => ->(obj) { return :object, obj['object'] },
      'contentType' => ->(obj) { return :content_type, obj['contentType'] },
      'crc32c' => ->(obj) { return :crc32c, obj['crc32c'] },
      'etag' => ->(obj) { return :etag, obj['etag'] },
      'generation' => ->(obj) { return :generation, obj['generation'] },
      'id' => ->(obj) { return :id, obj['id'] },
      'md5Hash' => ->(obj) { return :md5_hash, obj['md5Hash'] },
      'mediaLink' => ->(obj) { return :media_link, obj['mediaLink'] },
      'metageneration' => ->(obj) { return :metageneration, obj['metageneration'] },
      'name' => ->(obj) { return :object_name, obj['name'] },
      'size' => ->(obj) { return :size, obj['size'] },
      'storageClass' => ->(obj) { return :storage_class, obj['storageClass'] },
      'timeCreated' => ->(obj) { return :object_created_times, parse_time_string(obj['timeCreated']) },
      'timeDeleted' => ->(obj) { return :time_deleted, parse_time_string(obj['timeDeleted']) },
      'timeStorageClassUpdated' => ->(obj) { return :time_storage_class_updated, parse_time_string(obj['timeStorageClassUpdated']) },
      'updated' => ->(obj) { return :time_updated, parse_time_string(obj['updated']) },
    }
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  private

  def product_url(_ = nil)
    'https://www.googleapis.com/storage/v1/'
  end

  def resource_base_url
    'b/{{bucket}}/o'
  end
end
