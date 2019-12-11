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
#     Nathan is editing this to generate diffs in lots of files.
#     He won't submit this change.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------
module GoogleInSpec
  module CloudBuild
    module Property
      class TriggerTriggerTemplate
        attr_reader :project_id

        attr_reader :repo_name

        attr_reader :dir

        attr_reader :branch_name

        attr_reader :tag_name

        attr_reader :commit_sha

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @project_id = args['projectId']
          @repo_name = args['repoName']
          @dir = args['dir']
          @branch_name = args['branchName']
          @tag_name = args['tagName']
          @commit_sha = args['commitSha']
        end

        def to_s
          "#{@parent_identifier} TriggerTriggerTemplate"
        end
      end
    end
  end
end
