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
require 'google/mlengine/property/model_default_version'

# A provider to manage ML Engine resources.
class MLEngineModel < GcpResourceBase
  name 'google_ml_engine_model'
  desc 'Model'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :name
  attr_reader :description
  attr_reader :default_version
  attr_reader :regions
  attr_reader :online_prediction_logging
  attr_reader :online_prediction_console_logging
  attr_reader :labels

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url, resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @name = @fetched['name']
    @description = @fetched['description']
    @default_version = GoogleInSpec::MLEngine::Property::ModelDefaultVersion.new(@fetched['defaultVersion'], to_s)
    @regions = @fetched['regions']
    @online_prediction_logging = @fetched['onlinePredictionLogging']
    @online_prediction_console_logging = @fetched['onlinePredictionConsoleLogging']
    @labels = @fetched['labels']
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "Model #{@params[:name]}"
  end

  private

  def product_url
    'https://ml.googleapis.com/v1/'
  end

  def resource_base_url
    'projects/{{project}}/models/{{name}}'
  end
end
