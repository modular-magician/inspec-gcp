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
require 'google/accesscontextmanager/property/serviceperimeter_spec_egress_policies_egress_from'
require 'google/accesscontextmanager/property/serviceperimeter_spec_egress_policies_egress_to'
require 'google/accesscontextmanager/property/serviceperimeter_spec_egress_policies_egress_to_operations'
module GoogleInSpec
  module AccessContextManager
    module Property
      class ServicePerimeterSpecEgressPolicies
        attr_reader :egress_from

        attr_reader :egress_to

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @egress_from = GoogleInSpec::AccessContextManager::Property::ServicePerimeterSpecEgressPoliciesEgressFrom.new(args['egressFrom'], to_s)
          @egress_to = GoogleInSpec::AccessContextManager::Property::ServicePerimeterSpecEgressPoliciesEgressTo.new(args['egressTo'], to_s)
        end

        def to_s
          "#{@parent_identifier} ServicePerimeterSpecEgressPolicies"
        end
      end

      class ServicePerimeterSpecEgressPoliciesArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return ServicePerimeterSpecEgressPolicies.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| ServicePerimeterSpecEgressPolicies.new(v, parent_identifier) }
        end
      end
    end
  end
end