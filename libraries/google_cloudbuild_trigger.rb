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
require 'google/cloudbuild/property/trigger_build'
require 'google/cloudbuild/property/trigger_build_steps'
require 'google/cloudbuild/property/trigger_trigger_template'

# A provider to manage Cloud build resources.
class Trigger < GcpResourceBase
  name 'google_cloudbuild_trigger'
  desc 'Trigger'
  supports platform: 'gcp'

  attr_reader :id
  attr_reader :description
  attr_reader :disabled
  attr_reader :create_time
  attr_reader :substitutions
  attr_reader :filename
  attr_reader :ignored_files
  attr_reader :included_files
  attr_reader :trigger_template
  attr_reader :build

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @fetched = @connection.fetch(_base, _url, params)
    parse unless @fetched.nil?
  end

  def parse
    @id = @fetched['id']
    @description = @fetched['description']
    @disabled = @fetched['disabled']
    @create_time = parse_time_string(@fetched['createTime'])
    @substitutions = @fetched['substitutions']
    @filename = @fetched['filename']
    @ignored_files = @fetched['ignoredFiles']
    @included_files = @fetched['includedFiles']
    @trigger_template = GoogleInSpec::CloudBuild::Property::TriggerTriggerTemplate.new(@fetched['triggerTemplate'])
    @build = GoogleInSpec::CloudBuild::Property::TriggerBuild.new(@fetched['build'])
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  private

  def _base
    'https://cloudbuild.googleapis.com/v1/'
  end

  def _url
    'projects/{{project}}/triggers/{{id}}'
  end
end
