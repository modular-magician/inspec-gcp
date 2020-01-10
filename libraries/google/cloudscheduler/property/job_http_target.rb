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
require 'google/cloudscheduler/property/job_http_target_oauth_token'
require 'google/cloudscheduler/property/job_http_target_oidc_token'
module GoogleInSpec
  module CloudScheduler
    module Property
      class JobHttpTarget
        attr_reader :uri

        attr_reader :http_method

        attr_reader :body

        attr_reader :headers

        attr_reader :oauth_token

        attr_reader :oidc_token

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @uri = args['uri']
          @http_method = args['httpMethod']
          @body = args['body']
          @headers = args['headers']
          @oauth_token = GoogleInSpec::CloudScheduler::Property::JobHttpTargetOauthToken.new(args['oauthToken'], to_s)
          @oidc_token = GoogleInSpec::CloudScheduler::Property::JobHttpTargetOidcToken.new(args['oidcToken'], to_s)
        end

        def to_s
          "#{@parent_identifier} JobHttpTarget"
        end
      end
    end
  end
end
