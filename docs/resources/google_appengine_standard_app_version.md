---
title: About the google_appengine_standard_app_version resource
platform: gcp
---

## Syntax
A `google_appengine_standard_app_version` is used to test a Google StandardAppVersion resource

## Examples
```

describe google_appengine_standard_app_version(project: 'chef-gcp-inspec', location: 'europe-west2', version_id: 'v2', service: 'default') do
  it { should exist }
  its('version_id') { should eq 'v2' }
  its('runtime') { should eq 'nodejs10' }
end
```

## Properties
Properties that can be accessed from the `google_appengine_standard_app_version` resource:


  * `name`: Full path to the Version resource in the API. Example, "v1".

  * `version_id`: Relative name of the version within the service. For example, `v1`. Version names can contain only lowercase letters, numbers, or hyphens. Reserved names,"default", "latest", and any name with the prefix "ah-". 

  * `runtime`: Desired runtime. Example python27.

  * `threadsafe`: Whether multiple requests can be dispatched to this version at once.

  * `instance_class`: Instance class that is used to run this version. Valid values are AutomaticScaling F1, F2, F4, F4_1G (Only AutomaticScaling is supported at the moment)      

  * `automatic_scaling`: Automatic scaling is based on request rate, response latencies, and other application metrics.

    * `min_pending_latency`: Minimum amount of time a request should wait in the pending queue before starting a new instance to handle it. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s".

    * `standard_scheduler_settings`: Scheduler settings for standard environment.

      * `max_instances`: Maximum number of instances to run for this version. Set to zero to disable max_instances configuration.

      * `min_instances`: Minimum number of instances to run for this version. Set to zero to disable min_instances configuration.

      * `target_cpu_utilization`: Target CPU utilization ratio to maintain when scaling.

      * `target_throughput_utilization`: Target throughput utilization ratio to maintain when scaling.

    * `max_idle_instances`: Maximum number of idle instances that should be maintained for this version.

    * `request_utilization`: Target scaling by request utilization.

      * `target_request_count_per_second`: Target requests per second.

      * `target_concurrent_requests`: Target number of concurrent requests.

    * `min_idle_instances`: Minimum number of idle instances that should be maintained for this version. Only applicable for the default version of a service.

    * `max_total_instances`: Maximum number of instances that should be started to handle requests for this version.

    * `min_total_instances`: Minimum number of running instances that should be maintained for this version.

    * `network_utilization`: Target scaling by network usage.

      * `target_sent_bytes_per_second`: Target bytes sent per second.

      * `target_sent_packets_per_second`: Target packets sent per second.

      * `target_received_bytes_per_second`: Target bytes received per second.

      * `target_received_packets_per_second`: Target packets received per second.

    * `cool_down_period`: The time period that the Autoscaler (https://cloud.google.com/compute/docs/autoscaler/) should wait before it starts collecting information from a new instance. This prevents the autoscaler from collecting information when the instance is initializing, during which the collected usage would not be reliable. Only applicable in the App Engine flexible environment. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s".

    * `max_concurrent_requests`: Number of concurrent requests an automatic scaling instance can accept before the scheduler spawns a new instance.Defaults to a runtime-specific value.

    * `max_pending_latency`: Maximum amount of time that a request should wait in the pending queue before starting a new instance to handle it. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s".

    * `cpu_utilization`: Target scaling by CPU usage.

      * `target_utilization`: Target CPU utilization ratio to maintain when scaling. Must be between 0 and 1.

      * `aggregation_window_length`: Period of time over which CPU utilization is calculated. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s".

    * `disk_utilization`: Target scaling by disk usage.

      * `target_write_bytes_per_second`: Target bytes written per second.

      * `target_read_bytes_per_second`: Target bytes read per second.

      * `target_read_ops_per_second`: Target ops read per seconds.

      * `target_write_ops_per_second`: Target ops written per second.


## GCP Permissions

Ensure the [App Engine Admin API](https://console.cloud.google.com/apis/library/appengine.googleapis.com/) is enabled for the current project.
