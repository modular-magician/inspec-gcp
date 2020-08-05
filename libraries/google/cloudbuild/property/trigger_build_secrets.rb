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
  module CloudBuild
    module Property
      class TriggerBuildSecrets
        attr_reader :kms_key_name

        attr_reader :secret_env

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @kms_key_name = args['kmsKeyName']
          @secret_env = args['secretEnv']
        end

        def to_s
          "#{@parent_identifier} TriggerBuildSecrets"
        end
      end

      class TriggerBuildSecretsArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return TriggerBuildSecrets.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| TriggerBuildSecrets.new(v, parent_identifier) }
        end
      end
    end
  end
end
