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
require 'google/compute/property/instancetemplate_properties_disks_initialize_params_source_image_encryption_key'
module GoogleInSpec
  module Compute
    module Property
      class InstanceTemplatePropertiesDisksInitializeParams
        attr_reader :disk_name

        attr_reader :disk_size_gb

        attr_reader :disk_type

        attr_reader :source_image

        attr_reader :source_image_encryption_key

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @disk_name = args['diskName']
          @disk_size_gb = args['diskSizeGb']
          @disk_type = args['diskType']
          @source_image = args['sourceImage']
          @source_image_encryption_key = GoogleInSpec::Compute::Property::InstanceTemplatePropertiesDisksInitializeParamsSourceImageEncryptionKey.new(args['sourceImageEncryptionKey'], to_s)
        end

        def to_s
          "#{@parent_identifier} InstanceTemplatePropertiesDisksInitializeParams"
        end
      end
    end
  end
end
