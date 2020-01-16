---
title: About the google_project_alert_policies resource
platform: gcp
---

## Syntax
A `google_project_alert_policies` is used to test a Google AlertPolicy resource

## Examples
```
describe google_project_alert_policies(project: 'chef-gcp-inspec') do
  it { should exist }
  its('policy_display_names') { should include 'Display'}
  its('combiners') { should include 'OR'}
end
```

## Properties
Properties that can be accessed from the `google_project_alert_policies` resource:

See [google_project_alert_policy.md](google_project_alert_policy.md) for more detailed information
  * `policy_names`: an array of `google_project_alert_policy` name
  * `policy_display_names`: an array of `google_project_alert_policy` display_name
  * `combiners`: an array of `google_project_alert_policy` combiner
  * `creation_records`: an array of `google_project_alert_policy` creation_record
  * `policy_enabled_states`: an array of `google_project_alert_policy` enabled
  * `conditions`: an array of `google_project_alert_policy` conditions
  * `notification_channels`: an array of `google_project_alert_policy` notification_channels
  * `user_labels`: an array of `google_project_alert_policy` user_labels
  * `documentations`: an array of `google_project_alert_policy` documentation

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.

## GCP Permissions

Ensure the [Stackdriver Monitoring API](https://console.cloud.google.com/apis/library/monitoring.googleapis.com/) is enabled for the current project.
