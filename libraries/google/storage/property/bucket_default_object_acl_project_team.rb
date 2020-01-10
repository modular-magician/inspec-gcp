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
  module Storage
    module Property
      class BucketDefaultObjectAclProjectTeam
        attr_reader :project_number

        attr_reader :team

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @project_number = args['projectNumber']
          @team = args['team']
        end

        def to_s
          "#{@parent_identifier} BucketDefaultObjectAclProjectTeam"
        end
      end
    end
  end
end
