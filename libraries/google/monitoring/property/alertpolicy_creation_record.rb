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
  module Monitoring
    module Property
      class AlertPolicyCreationRecord
        attr_reader :mutate_time

        attr_reader :mutated_by

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @mutate_time = args['mutateTime']
          @mutated_by = args['mutatedBy']
        end

        def to_s
          "#{@parent_identifier} AlertPolicyCreationRecord"
        end
      end
    end
  end
end