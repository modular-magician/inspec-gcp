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
require 'google/compute/property/instance_disks_disk_encryption_key'
require 'google/compute/property/instance_disks_initialize_params'
require 'google/compute/property/instance_disks_initialize_params_source_image_encryption_key'
module GoogleInSpec
  module Compute
    module Property
      class InstanceDisks
        attr_reader :auto_delete

        attr_reader :boot

        attr_reader :device_name

        attr_reader :disk_encryption_key

        attr_reader :index

        attr_reader :initialize_params

        attr_reader :interface

        attr_reader :mode

        attr_reader :source

        attr_reader :type

        attr_reader :licenses

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @auto_delete = args['autoDelete']
          @boot = args['boot']
          @device_name = args['deviceName']
          @disk_encryption_key = GoogleInSpec::Compute::Property::InstanceDisksDiskEncryptionKey.new(args['diskEncryptionKey'], to_s)
          @index = args['index']
          @initialize_params = GoogleInSpec::Compute::Property::InstanceDisksInitializeParams.new(args['initializeParams'], to_s)
          @interface = args['interface']
          @mode = args['mode']
          @source = args['source']
          @type = args['type']
          @licenses = args['licenses']
        end

        def to_s
          "#{@parent_identifier} InstanceDisks"
        end
      end

      class InstanceDisksArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return InstanceDisks.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| InstanceDisks.new(v, parent_identifier) }
        end
      end
    end
  end
end
