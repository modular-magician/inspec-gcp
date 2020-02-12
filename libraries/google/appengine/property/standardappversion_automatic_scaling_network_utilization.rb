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
  module AppEngine
    module Property
      class StandardAppVersionAutomaticScalingNetworkUtilization
        attr_reader :target_sent_bytes_per_second

        attr_reader :target_sent_packets_per_second

        attr_reader :target_received_bytes_per_second

        attr_reader :target_received_packets_per_second

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @target_sent_bytes_per_second = args['targetSentBytesPerSecond']
          @target_sent_packets_per_second = args['targetSentPacketsPerSecond']
          @target_received_bytes_per_second = args['targetReceivedBytesPerSecond']
          @target_received_packets_per_second = args['targetReceivedPacketsPerSecond']
        end

        def to_s
          "#{@parent_identifier} StandardAppVersionAutomaticScalingNetworkUtilization"
        end
      end
    end
  end
end
