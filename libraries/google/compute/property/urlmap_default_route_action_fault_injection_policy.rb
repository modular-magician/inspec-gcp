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
require 'google/compute/property/urlmap_default_route_action_fault_injection_policy_abort'
require 'google/compute/property/urlmap_default_route_action_fault_injection_policy_delay'
require 'google/compute/property/urlmap_default_route_action_fault_injection_policy_delay_fixed_delay'
module GoogleInSpec
  module Compute
    module Property
      class UrlMapDefaultRouteActionFaultInjectionPolicy
        attr_reader :delay

        attr_reader :abort

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @delay = GoogleInSpec::Compute::Property::UrlMapDefaultRouteActionFaultInjectionPolicyDelay.new(args['delay'], to_s)
          @abort = GoogleInSpec::Compute::Property::UrlMapDefaultRouteActionFaultInjectionPolicyAbort.new(args['abort'], to_s)
        end

        def to_s
          "#{@parent_identifier} UrlMapDefaultRouteActionFaultInjectionPolicy"
        end
      end
    end
  end
end
