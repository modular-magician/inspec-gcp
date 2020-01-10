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
module GoogleInSpec
  module Compute
    module Property
      class InstanceTemplatePropertiesNetworkInterfacesAliasIpRanges
        attr_reader :ip_cidr_range

        attr_reader :subnetwork_range_name

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @ip_cidr_range = args['ipCidrRange']
          @subnetwork_range_name = args['subnetworkRangeName']
        end

        def to_s
          "#{@parent_identifier} InstanceTemplatePropertiesNetworkInterfacesAliasIpRanges"
        end
      end

      class InstanceTemplatePropertiesNetworkInterfacesAliasIpRangesArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return InstanceTemplatePropertiesNetworkInterfacesAliasIpRanges.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| InstanceTemplatePropertiesNetworkInterfacesAliasIpRanges.new(v, parent_identifier) }
        end
      end
    end
  end
end
