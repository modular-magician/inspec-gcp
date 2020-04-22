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

# A provider to manage Cloud (Stackdriver) Logging resources.
class LoggingProjectSink < GcpResourceBase
  name 'google_logging_project_sink'
  desc 'ProjectSink'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :project
  attr_reader :name
  attr_reader :filter
  attr_reader :destination
  attr_reader :writer_identity
  attr_reader :include_children

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @project = @fetched['project']
    @name = @fetched['name']
    @filter = @fetched['filter']
    @destination = @fetched['destination']
    @writer_identity = @fetched['writerIdentity']
    @include_children = @fetched['includeChildren']
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "ProjectSink #{@params[:name]}"
  end

  private

  def product_url(_ = nil)
    'https://logging.googleapis.com/v2/'
  end

  def resource_base_url
    'projects/{{project}}/sinks/{{name}}'
  end
end
