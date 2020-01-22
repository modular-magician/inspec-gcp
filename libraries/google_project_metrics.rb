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
class LoggingMetrics < GcpResourceBase
  name 'google_project_metrics'
  desc 'Metric plural resource'
  supports platform: 'gcp'

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:metric_names, field: :metric_name)
  filter_table_config.add(:descriptions, field: :description)
  filter_table_config.add(:metric_filters, field: :metric_filter)
  filter_table_config.add(:metric_descriptors, field: :metric_descriptor)
  filter_table_config.add(:label_extractors, field: :label_extractors)
  filter_table_config.add(:value_extractors, field: :value_extractor)
  filter_table_config.add(:bucket_options, field: :bucket_options)
  filter_table_config.add(:metric_types, field: :metric_type)

  filter_table_config.connect(self, :table)

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @table = fetch_wrapped_resource('metrics')
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
        hash_with_symbols[:metric_type] = hash.dig('metricDescriptor', 'type')
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
      'name' => ->(obj) { return :metric_name, obj['name'] },
      'description' => ->(obj) { return :description, obj['description'] },
      'filter' => ->(obj) { return :metric_filter, obj['filter'] },
      'metricDescriptor' => ->(obj) { return :metric_descriptor, GoogleInSpec::Logging::Property::MetricMetricDescriptor.new(obj['metricDescriptor'], to_s) },
      'labelExtractors' => ->(obj) { return :label_extractors, obj['labelExtractors'] },
      'valueExtractor' => ->(obj) { return :value_extractor, obj['valueExtractor'] },
      'bucketOptions' => ->(obj) { return :bucket_options, GoogleInSpec::Logging::Property::MetricBucketOptions.new(obj['bucketOptions'], to_s) },
    }
  end

  private

  def product_url(_ = nil)
    'https://logging.googleapis.com/v2/'
  end

  def resource_base_url
    'projects/{{project}}/metrics'
  end
end
