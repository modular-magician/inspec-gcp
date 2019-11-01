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
  module CloudScheduler
    module Property
      class JobPubsubTarget
        attr_reader :topic_name

        attr_reader :data

        attr_reader :attributes

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @topic_name = args['topicName']
          @data = args['data']
          @attributes = args['attributes']
        end

        def to_s
          "#{@parent_identifier} JobPubsubTarget"
        end
      end
    end
  end
end
