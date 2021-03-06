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
  module ResourceManager
    module Property
      class OrganizationPolicyListPolicy
        attr_reader :allowed_values

        attr_reader :denied_values

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @allowed_values = args['allowedValues']
          @denied_values = args['deniedValues']
        end

        def to_s
          "#{@parent_identifier} OrganizationPolicyListPolicy"
        end
      end
    end
  end
end
