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
require 'google/accesscontextmanager/property/serviceperimeter_status_ingress_policies_ingress_from'
require 'google/accesscontextmanager/property/serviceperimeter_status_ingress_policies_ingress_from_sources'
require 'google/accesscontextmanager/property/serviceperimeter_status_ingress_policies_ingress_to'
require 'google/accesscontextmanager/property/serviceperimeter_status_ingress_policies_ingress_to_operations'
module GoogleInSpec
  module AccessContextManager
    module Property
      class ServicePerimeterStatusIngressPolicies
        attr_reader :ingress_to

        attr_reader :ingress_from

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @ingress_to = GoogleInSpec::AccessContextManager::Property::ServicePerimeterStatusIngressPoliciesIngressTo.new(args['ingressTo'], to_s)
          @ingress_from = GoogleInSpec::AccessContextManager::Property::ServicePerimeterStatusIngressPoliciesIngressFrom.new(args['ingressFrom'], to_s)
        end

        def to_s
          "#{@parent_identifier} ServicePerimeterStatusIngressPolicies"
        end
      end

      class ServicePerimeterStatusIngressPoliciesArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return ServicePerimeterStatusIngressPolicies.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| ServicePerimeterStatusIngressPolicies.new(v, parent_identifier) }
        end
      end
    end
  end
end