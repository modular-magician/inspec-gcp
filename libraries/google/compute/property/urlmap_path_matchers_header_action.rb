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
require 'google/compute/property/urlmap_path_matchers_header_action_request_headers_to_add'
require 'google/compute/property/urlmap_path_matchers_header_action_response_headers_to_add'
module GoogleInSpec
  module Compute
    module Property
      class UrlMapPathMatchersHeaderAction
        attr_reader :request_headers_to_add

        attr_reader :request_headers_to_remove

        attr_reader :response_headers_to_add

        attr_reader :response_headers_to_remove

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @request_headers_to_add = GoogleInSpec::Compute::Property::UrlMapPathMatchersHeaderActionRequestHeadersToAddArray.parse(args['requestHeadersToAdd'], to_s)
          @request_headers_to_remove = args['requestHeadersToRemove']
          @response_headers_to_add = GoogleInSpec::Compute::Property::UrlMapPathMatchersHeaderActionResponseHeadersToAddArray.parse(args['responseHeadersToAdd'], to_s)
          @response_headers_to_remove = args['responseHeadersToRemove']
        end

        def to_s
          "#{@parent_identifier} UrlMapPathMatchersHeaderAction"
        end
      end
    end
  end
end
