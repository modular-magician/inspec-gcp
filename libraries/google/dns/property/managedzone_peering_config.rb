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
require 'google/dns/property/managedzone_peering_config_target_network'
module GoogleInSpec
  module DNS
    module Property
      class ManagedZonePeeringConfig
        attr_reader :target_network

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @target_network = GoogleInSpec::DNS::Property::ManagedZonePeeringConfigTargetNetwork.new(args['targetNetwork'], to_s)
        end

        def to_s
          "#{@parent_identifier} ManagedZonePeeringConfig"
        end
      end
    end
  end
end
