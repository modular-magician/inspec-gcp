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
require 'google/container/property/regionalcluster_node_config_accelerators'
require 'google/container/property/regionalcluster_node_config_taints'
module GoogleInSpec
  module Container
    module Property
      class RegionalClusterNodeConfig
        attr_reader :machine_type

        attr_reader :disk_size_gb

        attr_reader :oauth_scopes

        attr_reader :service_account

        attr_reader :metadata

        attr_reader :image_type

        attr_reader :labels

        attr_reader :local_ssd_count

        attr_reader :tags

        attr_reader :preemptible

        attr_reader :accelerators

        attr_reader :disk_type

        attr_reader :min_cpu_platform

        attr_reader :taints

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @machine_type = args['machineType']
          @disk_size_gb = args['diskSizeGb']
          @oauth_scopes = args['oauthScopes']
          @service_account = args['serviceAccount']
          @metadata = args['metadata']
          @image_type = args['imageType']
          @labels = args['labels']
          @local_ssd_count = args['localSsdCount']
          @tags = args['tags']
          @preemptible = args['preemptible']
          @accelerators = GoogleInSpec::Container::Property::RegionalClusterNodeConfigAcceleratorsArray.parse(args['accelerators'], to_s)
          @disk_type = args['diskType']
          @min_cpu_platform = args['minCpuPlatform']
          @taints = GoogleInSpec::Container::Property::RegionalClusterNodeConfigTaintsArray.parse(args['taints'], to_s)
        end

        def to_s
          "#{@parent_identifier} RegionalClusterNodeConfig"
        end
      end
    end
  end
end
