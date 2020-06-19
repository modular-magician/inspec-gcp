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
require 'google/compute/property/autoscaler_autoscaling_policy_cpu_utilization'
require 'google/compute/property/autoscaler_autoscaling_policy_custom_metric_utilizations'
require 'google/compute/property/autoscaler_autoscaling_policy_load_balancing_utilization'
require 'google/compute/property/autoscaler_autoscaling_policy_scale_down_control'
require 'google/compute/property/autoscaler_autoscaling_policy_scale_down_control_max_scaled_down_replicas'
module GoogleInSpec
  module Compute
    module Property
      class AutoscalerAutoscalingPolicy
        attr_reader :min_num_replicas

        attr_reader :max_num_replicas

        attr_reader :cool_down_period_sec

        attr_reader :scale_down_control

        attr_reader :cpu_utilization

        attr_reader :custom_metric_utilizations

        attr_reader :load_balancing_utilization

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @min_num_replicas = args['minNumReplicas']
          @max_num_replicas = args['maxNumReplicas']
          @cool_down_period_sec = args['coolDownPeriodSec']
          @scale_down_control = GoogleInSpec::Compute::Property::AutoscalerAutoscalingPolicyScaleDownControl.new(args['scaleDownControl'], to_s)
          @cpu_utilization = GoogleInSpec::Compute::Property::AutoscalerAutoscalingPolicyCpuUtilization.new(args['cpuUtilization'], to_s)
          @custom_metric_utilizations = GoogleInSpec::Compute::Property::AutoscalerAutoscalingPolicyCustomMetricUtilizationsArray.parse(args['customMetricUtilizations'], to_s)
          @load_balancing_utilization = GoogleInSpec::Compute::Property::AutoscalerAutoscalingPolicyLoadBalancingUtilization.new(args['loadBalancingUtilization'], to_s)
        end

        def to_s
          "#{@parent_identifier} AutoscalerAutoscalingPolicy"
        end
      end
    end
  end
end
