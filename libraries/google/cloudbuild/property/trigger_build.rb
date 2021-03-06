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
require 'google/cloudbuild/property/trigger_build_artifacts'
require 'google/cloudbuild/property/trigger_build_artifacts_objects'
require 'google/cloudbuild/property/trigger_build_artifacts_objects_timing'
require 'google/cloudbuild/property/trigger_build_options'
require 'google/cloudbuild/property/trigger_build_options_volumes'
require 'google/cloudbuild/property/trigger_build_secrets'
require 'google/cloudbuild/property/trigger_build_source'
require 'google/cloudbuild/property/trigger_build_source_repo_source'
require 'google/cloudbuild/property/trigger_build_source_storage_source'
require 'google/cloudbuild/property/trigger_build_steps'
module GoogleInSpec
  module CloudBuild
    module Property
      class TriggerBuild
        attr_reader :source

        attr_reader :tags

        attr_reader :images

        attr_reader :substitutions

        attr_reader :queue_ttl

        attr_reader :logs_bucket

        attr_reader :timeout

        attr_reader :secrets

        attr_reader :steps

        attr_reader :artifacts

        attr_reader :options

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @source = GoogleInSpec::CloudBuild::Property::TriggerBuildSource.new(args['source'], to_s)
          @tags = args['tags']
          @images = args['images']
          @substitutions = args['substitutions']
          @queue_ttl = args['queueTtl']
          @logs_bucket = args['logsBucket']
          @timeout = args['timeout']
          @secrets = GoogleInSpec::CloudBuild::Property::TriggerBuildSecretsArray.parse(args['secrets'], to_s)
          @steps = GoogleInSpec::CloudBuild::Property::TriggerBuildStepsArray.parse(args['steps'], to_s)
          @artifacts = GoogleInSpec::CloudBuild::Property::TriggerBuildArtifacts.new(args['artifacts'], to_s)
          @options = GoogleInSpec::CloudBuild::Property::TriggerBuildOptions.new(args['options'], to_s)
        end

        def to_s
          "#{@parent_identifier} TriggerBuild"
        end
      end
    end
  end
end
