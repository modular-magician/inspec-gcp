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
require 'google/compute/property/backendservice_circuit_breakers_connect_timeout'
module GoogleInSpec
  module Compute
    module Property
      class BackendServiceCircuitBreakers
        attr_reader :connect_timeout

        attr_reader :max_requests_per_connection

        attr_reader :max_connections

        attr_reader :max_pending_requests

        attr_reader :max_requests

        attr_reader :max_retries

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @connect_timeout = GoogleInSpec::Compute::Property::BackendServiceCircuitBreakersConnectTimeout.new(args['connectTimeout'], to_s)
          @max_requests_per_connection = args['maxRequestsPerConnection']
          @max_connections = args['maxConnections']
          @max_pending_requests = args['maxPendingRequests']
          @max_requests = args['maxRequests']
          @max_retries = args['maxRetries']
        end

        def to_s
          "#{@parent_identifier} BackendServiceCircuitBreakers"
        end
      end
    end
  end
end