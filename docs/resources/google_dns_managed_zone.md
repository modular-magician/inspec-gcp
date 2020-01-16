---
title: About the google_dns_managed_zone resource
platform: gcp
---

## Syntax
A `google_dns_managed_zone` is used to test a Google ManagedZone resource

## Examples
```
describe google_dns_managed_zone(project: 'chef-gcp-inspec', zone: 'example-zone') do
  it { should exist }
  its('dns_name') { should cmp 'dns-zone-name.com.' }

  its('description') { should cmp 'example description' }
  its('zone_signing_key_algorithm') { should cmp 'rsasha256' }
  its('key_signing_key_algorithm') { should cmp 'rsasha512' }
end

describe google_dns_managed_zone(project: 'chef-gcp-inspec', zone: 'nonexistent') do
  it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_dns_managed_zone` resource:


  * `description`: A mutable string of at most 1024 characters associated with this resource for the user's convenience. Has no effect on the managed zone's function.

  * `dns_name`: The DNS name of this managed zone, for instance "example.com.".

  * `dnssec_config`: DNSSEC configuration

    * `kind`: Identifies what kind of resource this is

    * `non_existence`: Specifies the mechanism used to provide authenticated denial-of-existence responses.

    * `state`: Specifies whether DNSSEC is enabled, and what mode it is in

    * `default_key_specs`: Specifies parameters that will be used for generating initial DnsKeys for this ManagedZone. If you provide a spec for keySigning or zoneSigning, you must also provide one for the other.

      * `algorithm`: String mnemonic specifying the DNSSEC algorithm of this key

      * `key_length`: Length of the keys in bits

      * `key_type`: Specifies whether this is a key signing key (KSK) or a zone signing key (ZSK). Key signing keys have the Secure Entry Point flag set and, when active, will only be used to sign resource record sets of type DNSKEY. Zone signing keys do not have the Secure Entry Point flag set and will be used to sign all other types of resource record sets. 

      * `kind`: Identifies what kind of resource this is

  * `id`: Unique identifier for the resource; defined by the server.

  * `name`: User assigned name for this resource. Must be unique within the project.

  * `name_servers`: Delegate your managed_zone to these virtual name servers; defined by the server

  * `name_server_set`: Optionally specifies the NameServerSet for this ManagedZone. A NameServerSet is a set of DNS name servers that all host the same ManagedZones. Most users will leave this field unset.

  * `creation_time`: The time that this resource was created on the server. This is in RFC3339 text format.

  * `labels`: A set of key/value label pairs to assign to this ManagedZone.

  * `visibility`: The zone's visibility: public zones are exposed to the Internet, while private zones are visible only to Virtual Private Cloud resources. Must be one of: `public`, `private`.

  * `private_visibility_config`: For privately visible zones, the set of Virtual Private Cloud resources that the zone is visible from.

    * `networks`: The list of VPC networks that can see this zone.

      * `network_url`: The fully qualified URL of the VPC network to bind to. This should be formatted like `https://www.googleapis.com/compute/v1/projects/{project}/global/networks/{network}`


## GCP Permissions

Ensure the [Google Cloud DNS API](https://console.cloud.google.com/apis/library/dns.googleapis.com/) is enabled for the current project.
