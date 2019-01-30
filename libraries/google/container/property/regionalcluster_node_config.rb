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
  module Container
    module Property
      class RegionalClusterNodeconfig
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

        def initialize(args = nil)
          return if args.nil?
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
        end
      end
    end
  end
end
