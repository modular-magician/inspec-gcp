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
require 'google/cloudbuild/property/trigger_github_pull_request'
require 'google/cloudbuild/property/trigger_github_push'
module GoogleInSpec
  module CloudBuild
    module Property
      class TriggerGithub
        attr_reader :owner

        attr_reader :name

        attr_reader :pull_request

        attr_reader :push

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @owner = args['owner']
          @name = args['name']
          @pull_request = GoogleInSpec::CloudBuild::Property::TriggerGithubPullRequest.new(args['pullRequest'], to_s)
          @push = GoogleInSpec::CloudBuild::Property::TriggerGithubPush.new(args['push'], to_s)
        end

        def to_s
          "#{@parent_identifier} TriggerGithub"
        end
      end
    end
  end
end
