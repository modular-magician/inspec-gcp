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
module GoogleInSpec
  module AccessContextManager
    module Property
      class ServicePerimeterStatusIngressPoliciesIngressToOperationsMethodSelectors
        attr_reader :method

        attr_reader :permission

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @method = args['method']
          @permission = args['permission']
        end

        def to_s
          "#{@parent_identifier} ServicePerimeterStatusIngressPoliciesIngressToOperationsMethodSelectors"
        end
      end

      class ServicePerimeterStatusIngressPoliciesIngressToOperationsMethodSelectorsArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return ServicePerimeterStatusIngressPoliciesIngressToOperationsMethodSelectors.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| ServicePerimeterStatusIngressPoliciesIngressToOperationsMethodSelectors.new(v, parent_identifier) }
        end
      end
    end
  end
end
