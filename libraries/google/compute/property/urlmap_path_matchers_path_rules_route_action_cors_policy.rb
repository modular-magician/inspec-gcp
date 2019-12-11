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
module GoogleInSpec
  module Compute
    module Property
      class UrlMapPathMatchersPathRulesRouteActionCorsPolicy
        attr_reader :allow_credentials

        attr_reader :allow_headers

        attr_reader :allow_methods

        attr_reader :allow_origin_regexes

        attr_reader :allow_origins

        attr_reader :disabled

        attr_reader :expose_headers

        attr_reader :max_age

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @allow_credentials = args['allowCredentials']
          @allow_headers = args['allowHeaders']
          @allow_methods = args['allowMethods']
          @allow_origin_regexes = args['allowOriginRegexes']
          @allow_origins = args['allowOrigins']
          @disabled = args['disabled']
          @expose_headers = args['exposeHeaders']
          @max_age = args['maxAge']
        end

        def to_s
          "#{@parent_identifier} UrlMapPathMatchersPathRulesRouteActionCorsPolicy"
        end
      end
    end
  end
end
