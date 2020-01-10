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
require 'google/bigquery/property/table_view_user_defined_function_resources'
module GoogleInSpec
  module BigQuery
    module Property
      class TableView
        attr_reader :use_legacy_sql

        attr_reader :user_defined_function_resources

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @use_legacy_sql = args['useLegacySql']
          @user_defined_function_resources = GoogleInSpec::BigQuery::Property::TableViewUserDefinedFunctionResourcesArray.parse(args['userDefinedFunctionResources'], to_s)
        end

        def to_s
          "#{@parent_identifier} TableView"
        end
      end
    end
  end
end
