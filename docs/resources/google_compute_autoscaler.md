---
title: About the google_compute_autoscaler resource
platform: gcp
---

## Syntax
A `google_compute_autoscaler` is used to test a Google Autoscaler resource

## Examples
```
describe google_compute_autoscaler(project: 'chef-gcp-inspec', zone: 'zone', name: 'inspec-gcp-autoscaler') do
  it { should exist }

  its('target') { should match /\/inspec-gcp-igm$/ }
  its('autoscaling_policy.max_num_replicas') { should eq '5' }
  its('autoscaling_policy.min_num_replicas') { should eq '1' }
  its('autoscaling_policy.cool_down_period_sec') { should eq '60' }
  its('autoscaling_policy.cpu_utilization.utilization_target') { should eq '0.5' }
end

describe google_compute_autoscaler(project: 'chef-gcp-inspec', zone: 'zone', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_compute_autoscaler` resource:


  * `id`: Unique identifier for the resource.

  * `creation_timestamp`: Creation timestamp in RFC3339 text format.

  * `name`: Name of the resource. The name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.

  * `description`: An optional description of this resource.

  * `autoscaling_policy`: The configuration parameters for the autoscaling algorithm. You can define one or more of the policies for an autoscaler: cpuUtilization, customMetricUtilizations, and loadBalancingUtilization.  If none of these are specified, the default will be to autoscale based on cpuUtilization to 0.6 or 60%.

    * `min_num_replicas`: The minimum number of replicas that the autoscaler can scale down to. This cannot be less than 0. If not provided, autoscaler will choose a default value depending on maximum number of instances allowed.

    * `max_num_replicas`: The maximum number of instances that the autoscaler can scale up to. This is required when creating or updating an autoscaler. The maximum number of replicas should not be lower than minimal number of replicas.

    * `cool_down_period_sec`: The number of seconds that the autoscaler should wait before it starts collecting information from a new instance. This prevents the autoscaler from collecting information when the instance is initializing, during which the collected usage would not be reliable. The default time autoscaler waits is 60 seconds.  Virtual machine initialization times might vary because of numerous factors. We recommend that you test how long an instance may take to initialize. To do this, create an instance and time the startup process.

    * `cpu_utilization`: Defines the CPU utilization policy that allows the autoscaler to scale based on the average CPU utilization of a managed instance group.

      * `utilization_target`: The target CPU utilization that the autoscaler should maintain. Must be a float value in the range (0, 1]. If not specified, the default is 0.6.  If the CPU level is below the target utilization, the autoscaler scales down the number of instances until it reaches the minimum number of instances you specified or until the average CPU of your instances reaches the target utilization.  If the average CPU is above the target utilization, the autoscaler scales up until it reaches the maximum number of instances you specified or until the average utilization reaches the target utilization.

    * `custom_metric_utilizations`: Defines the CPU utilization policy that allows the autoscaler to scale based on the average CPU utilization of a managed instance group.

      * `metric`: The identifier (type) of the Stackdriver Monitoring metric. The metric cannot have negative values.  The metric must have a value type of INT64 or DOUBLE.

      * `utilization_target`: The target value of the metric that autoscaler should maintain. This must be a positive value. A utilization metric scales number of virtual machines handling requests to increase or decrease proportionally to the metric.  For example, a good metric to use as a utilizationTarget is www.googleapis.com/compute/instance/network/received_bytes_count. The autoscaler will work to keep this value constant for each of the instances.

      * `utilization_target_type`: Defines how target utilization value is expressed for a Stackdriver Monitoring metric. Either GAUGE, DELTA_PER_SECOND, or DELTA_PER_MINUTE.

    * `load_balancing_utilization`: Configuration parameters of autoscaling based on a load balancer.

      * `utilization_target`: Fraction of backend capacity utilization (set in HTTP(s) load balancing configuration) that autoscaler should maintain. Must be a positive float value. If not defined, the default is 0.8.

  * `target`: URL of the managed instance group that this autoscaler will scale.

  * `zone`: URL of the zone where the instance group resides.


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
