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
  module Compute
    module Property
      class SnapshotSourceDiskEncryptionKey
        attr_reader :raw_key

        attr_reader :kms_key_name

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @raw_key = args['rawKey']
          @kms_key_name = args['kmsKeyName']
        end

        def to_s
          "#{@parent_identifier} SnapshotSourceDiskEncryptionKey"
        end
      end
    end
  end
end
