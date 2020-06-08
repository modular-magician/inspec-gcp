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
require 'google/compute/property/urlmap_path_matchers_default_route_action_fault_injection_policy_delay_fixed_delay'
module GoogleInSpec
  module Compute
    module Property
      class UrlMapPathMatchersDefaultRouteActionFaultInjectionPolicyDelay
        attr_reader :fixed_delay

        attr_reader :percentage

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @fixed_delay = GoogleInSpec::Compute::Property::UrlMapPathMatchersDefaultRouteActionFaultInjectionPolicyDelayFixedDelay.new(args['fixedDelay'], to_s)
          @percentage = args['percentage']
        end

        def to_s
          "#{@parent_identifier} UrlMapPathMatchersDefaultRouteActionFaultInjectionPolicyDelay"
        end
      end
    end
  end
end
