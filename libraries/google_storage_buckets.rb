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
class StorageBuckets < GcpResourceBase
  name 'google_storage_buckets'
  desc 'Bucket plural resource'
  supports platform: 'gcp'

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:acls, field: :acl)
  filter_table_config.add(:cors, field: :cors)
  filter_table_config.add(:default_object_acls, field: :default_object_acl)
  filter_table_config.add(:bucket_ids, field: :bucket_id)
  filter_table_config.add(:lifecycles, field: :lifecycle)
  filter_table_config.add(:bucket_locations, field: :bucket_location)
  filter_table_config.add(:loggings, field: :logging)
  filter_table_config.add(:metagenerations, field: :metageneration)
  filter_table_config.add(:bucket_names, field: :bucket_name)
  filter_table_config.add(:owners, field: :owner)
  filter_table_config.add(:bucket_project_numbers, field: :bucket_project_number)
  filter_table_config.add(:storage_classes, field: :storage_class)
  filter_table_config.add(:time_createds, field: :time_created)
  filter_table_config.add(:updateds, field: :updated)
  filter_table_config.add(:versionings, field: :versioning)
  filter_table_config.add(:websites, field: :website)
  filter_table_config.add(:projects, field: :project)
  filter_table_config.add(:predefined_default_object_acls, field: :predefined_default_object_acl)

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
      'acl' => ->(obj) { return :acl, GoogleInSpec::Storage::Property::BucketAclArray.parse(obj['acl'], to_s) },
      'cors' => ->(obj) { return :cors, GoogleInSpec::Storage::Property::BucketCorsArray.parse(obj['cors'], to_s) },
      'defaultObjectAcl' => ->(obj) { return :default_object_acl, GoogleInSpec::Storage::Property::BucketDefaultObjectAclArray.parse(obj['defaultObjectAcl'], to_s) },
      'id' => ->(obj) { return :bucket_id, obj['id'] },
      'lifecycle' => ->(obj) { return :lifecycle, GoogleInSpec::Storage::Property::BucketLifecycle.new(obj['lifecycle'], to_s) },
      'location' => ->(obj) { return :bucket_location, obj['location'] },
      'logging' => ->(obj) { return :logging, GoogleInSpec::Storage::Property::BucketLogging.new(obj['logging'], to_s) },
      'metageneration' => ->(obj) { return :metageneration, obj['metageneration'] },
      'name' => ->(obj) { return :bucket_name, obj['name'] },
      'owner' => ->(obj) { return :owner, GoogleInSpec::Storage::Property::BucketOwner.new(obj['owner'], to_s) },
      'projectNumber' => ->(obj) { return :bucket_project_number, obj['projectNumber'] },
      'storageClass' => ->(obj) { return :storage_class, obj['storageClass'] },
      'timeCreated' => ->(obj) { return :time_created, parse_time_string(obj['timeCreated']) },
      'updated' => ->(obj) { return :updated, parse_time_string(obj['updated']) },
      'versioning' => ->(obj) { return :versioning, GoogleInSpec::Storage::Property::BucketVersioning.new(obj['versioning'], to_s) },
      'website' => ->(obj) { return :website, GoogleInSpec::Storage::Property::BucketWebsite.new(obj['website'], to_s) },
      'project' => ->(obj) { return :project, obj['project'] },
      'predefinedDefaultObjectAcl' => ->(obj) { return :predefined_default_object_acl, obj['predefinedDefaultObjectAcl'] },
    }
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  private

  def product_url
    'https://www.googleapis.com/storage/v1/'
  end

  def resource_base_url
    'b?project={{project}}&projection=full'
  end
end
