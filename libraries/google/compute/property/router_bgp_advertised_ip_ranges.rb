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
      class RouterBgpAdvertisedIpRanges
        attr_reader :range

        attr_reader :description

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @range = args['range']
          @description = args['description']
        end

        def to_s
          "#{@parent_identifier} RouterBgpAdvertisedIpRanges"
        end
      end

      class RouterBgpAdvertisedIpRangesArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return RouterBgpAdvertisedIpRanges.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| RouterBgpAdvertisedIpRanges.new(v, parent_identifier) }
        end
      end
    end
  end
end
