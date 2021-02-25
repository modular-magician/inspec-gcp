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
require 'google/accesscontextmanager/property/serviceperimeter_status_ingress_policies_ingress_from_sources'
module GoogleInSpec
  module AccessContextManager
    module Property
      class ServicePerimeterStatusIngressPoliciesIngressFrom
        attr_reader :identities

        attr_reader :sources

        attr_reader :identity_type

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @identities = args['identities']
          @sources = GoogleInSpec::AccessContextManager::Property::ServicePerimeterStatusIngressPoliciesIngressFromSourcesArray.parse(args['sources'], to_s)
          @identity_type = args['identityType']
        end

        def to_s
          "#{@parent_identifier} ServicePerimeterStatusIngressPoliciesIngressFrom"
        end
      end
    end
  end
end