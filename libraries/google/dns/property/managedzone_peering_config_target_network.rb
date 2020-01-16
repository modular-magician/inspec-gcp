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
  module DNS
    module Property
      class ManagedZonePeeringConfigTargetNetwork
        attr_reader :network_url

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @network_url = args['networkUrl']
        end

        def to_s
          "#{@parent_identifier} ManagedZonePeeringConfigTargetNetwork"
        end
      end
    end
  end
end
