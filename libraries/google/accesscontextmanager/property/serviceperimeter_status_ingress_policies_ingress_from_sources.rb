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
      class ServicePerimeterStatusIngressPoliciesIngressFromSources
        attr_reader :access_level

        attr_reader :resource

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @access_level = args['accessLevel']
          @resource = args['resource']
        end

        def to_s
          "#{@parent_identifier} ServicePerimeterStatusIngressPoliciesIngressFromSources"
        end
      end

      class ServicePerimeterStatusIngressPoliciesIngressFromSourcesArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return ServicePerimeterStatusIngressPoliciesIngressFromSources.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| ServicePerimeterStatusIngressPoliciesIngressFromSources.new(v, parent_identifier) }
        end
      end
    end
  end
end
