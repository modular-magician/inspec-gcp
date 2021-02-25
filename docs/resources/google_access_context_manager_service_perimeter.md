---
title: About the google_access_context_manager_service_perimeter resource
platform: gcp
---

## Syntax
A `google_access_context_manager_service_perimeter` is used to test a Google ServicePerimeter resource

## Examples
```

describe.one do
  google_access_context_manager_access_policies(org_id: '190694428152').names.each do |policy_name|
    describe google_access_context_manager_service_perimeter(policy_name: policy_name, name: 'restrict_all') do
      it { should exist }
      its('title') { should cmp 'restrict_all' }
      its('status.restricted_services') { should include 'storage.googleapis.com' }
    end
  end
end
```

## Properties
Properties that can be accessed from the `google_access_context_manager_service_perimeter` resource:


  * `title`: Human readable title. Must be unique within the Policy.

  * `description`: Description of the ServicePerimeter and its use. Does not affect behavior.

  * `create_time`: Time the AccessPolicy was created in UTC.

  * `update_time`: Time the AccessPolicy was updated in UTC.

  * `perimeter_type`: Specifies the type of the Perimeter. There are two types: regular and bridge. Regular Service Perimeter contains resources, access levels, and restricted services. Every resource can be in at most ONE regular Service Perimeter.  In addition to being in a regular service perimeter, a resource can also be in zero or more perimeter bridges. A perimeter bridge only contains resources. Cross project operations are permitted if all effected resources share some perimeter (whether bridge or regular). Perimeter Bridge does not contain access levels or services: those are governed entirely by the regular perimeter that resource is in.  Perimeter Bridges are typically useful when building more complex topologies with many independent perimeters that need to share some data with a common perimeter, but should not be able to share data among themselves.
  Possible values:
    * PERIMETER_TYPE_REGULAR
    * PERIMETER_TYPE_BRIDGE

  * `status`: ServicePerimeter configuration. Specifies sets of resources, restricted services and access levels that determine perimeter content and boundaries.

    * `resources`: A list of GCP resources that are inside of the service perimeter. Currently only projects are allowed. Format: projects/{project_number}

    * `access_levels`: A list of AccessLevel resource names that allow resources within the ServicePerimeter to be accessed from the internet. AccessLevels listed must be in the same policy as this ServicePerimeter. Referencing a nonexistent AccessLevel is a syntax error. If no AccessLevel names are listed, resources within the perimeter can only be accessed via GCP calls with request origins within the perimeter. For Service Perimeter Bridge, must be empty.  Format: accessPolicies/{policy_id}/accessLevels/{access_level_name}

    * `restricted_services`: GCP services that are subject to the Service Perimeter restrictions. Must contain a list of services. For example, if `storage.googleapis.com` is specified, access to the storage buckets inside the perimeter must meet the perimeter's access restrictions.

    * `vpc_accessible_services`: Specifies how APIs are allowed to communicate within the Service Perimeter.

      * `enable_restriction`: Whether to restrict API calls within the Service Perimeter to the list of APIs specified in 'allowedServices'.

      * `allowed_services`: The list of APIs usable within the Service Perimeter. Must be empty unless `enableRestriction` is True.

    * `ingress_policies`: (Beta only) List of IngressPolicies to apply to the perimeter. A perimeter may have multiple IngressPolicies, each of which is evaluated separately. Access is granted if any Ingress Policy grants it. Must be empty for a perimeter bridge.

      * `ingress_to`: Defines the conditions on the ApiOperation and request destination that cause this IngressPolicy to apply.

        * `resources`: A list of resources, currently only projects in the form `projects/`, protected by this ServicePerimeter that are allowed to be accessed by sources defined in the corresponding IngressFrom. A request matches if it contains a resource in this list. If `*` is specified for resources, then this IngressTo rule will authorize access to all resources inside the perimeter, provided that the request also matches the `operations` field.

        * `operations`: A list of ApiOperations the sources specified in corresponding IngressFrom are allowed to perform in this ServicePerimeter.

          * `method_selectors`: API methods or permissions to allow. Method or permission must belong to the service specified by `service_name` field. A single MethodSelector entry with `*` specified for the `method` field will allow all methods AND permissions for the service specified in `service_name`.

            * `permission`: Value for `permission` should be a valid Cloud IAM permission for the corresponding `service_name` in ApiOperation.

            * `method`: Value for `method` should be a valid method name for the corresponding `service_name` in ApiOperation. If `*` used as value for `method`, then ALL methods and permissions are allowed.

          * `service_name`: The name of the API whose methods or permissions the IngressPolicy or EgressPolicy want to allow. A single ApiOperation with `service_name` field set to `*` will allow all methods AND permissions for all services.

      * `ingress_from`: Defines the conditions on the source of a request causing this IngressPolicy to apply.

        * `identities`: A list of identities that are allowed access through this ingress policy. Should be in the format of email address. The email address should represent individual user or service account only.

        * `sources`: Sources that this IngressPolicy authorizes access from.

          * `resource`: A Google Cloud resource that is allowed to ingress the perimeter. Requests from these resources will be allowed to access perimeter data. Currently only projects are allowed. Format: `projects/{project_number}` The project may be in any Google Cloud organization, not just the organization that the perimeter is defined in. `*` is not allowed, the case of allowing all Google Cloud resources only is not supported.

          * `access_level`: An AccessLevel resource name that allow resources within the ServicePerimeters to be accessed from the internet. AccessLevels listed must be in the same policy as this ServicePerimeter. Referencing a nonexistent AccessLevel will cause an error. If no AccessLevel names are listed, resources within the perimeter can only be accessed via Google Cloud calls with request origins within the perimeter. Example: `accessPolicies/MY_POLICY/accessLevels/MY_LEVEL`. If `*` is specified, then all IngressSources will be allowed.

        * `identity_type`: Specifies the type of identities that are allowed access from outside the perimeter. If left unspecified, then members of `identities` field will be allowed access.
        Possible values:
          * IDENTITY_TYPE_UNSPECIFIED
          * ANY_IDENTITY
          * ANY_USER_ACCOUNT
          * ANY_SERVICE_ACCOUNT

    * `egress_policies`: (Beta only) List of EgressPolicies to apply to the perimeter. A perimeter may have multiple EgressPolicies, each of which is evaluated separately. Access is granted if any EgressPolicy grants it. Must be empty for a perimeter bridge.

      * `egress_from`: Defines conditions on the source of a request causing this EgressPolicy to apply.

        * `identities`: A list of identities that are allowed access through this [EgressPolicy]. Should be in the format of email address. The email address should represent individual user or service account only.

        * `identity_type`: Specifies the type of identities that are allowed access to outside the perimeter. If left unspecified, then members of `identities` field will be allowed access.
        Possible values:
          * IDENTITY_TYPE_UNSPECIFIED
          * ANY_IDENTITY
          * ANY_USER_ACCOUNT
          * ANY_SERVICE_ACCOUNT

      * `egress_to`: Defines the conditions on the ApiOperation and destination resources that cause this EgressPolicy to apply.

        * `resources`: A list of resources, currently only projects in the form `projects/`, that match this to stanza. A request matches if it contains a resource in this list. If `*` is specified for resources, then this EgressTo rule will authorize access to all resources outside the perimeter.

        * `operations`: A list of ApiOperations that this egress rule applies to. A request matches if it contains an operation/service in this list.

          * `method_selectors`: API methods or permissions to allow. Method or permission must belong to the service specified by `service_name` field. A single MethodSelector entry with `*` specified for the `method` field will allow all methods AND permissions for the service specified in `service_name`.

            * `permission`: Value for `permission` should be a valid Cloud IAM permission for the corresponding `service_name` in ApiOperation.

            * `method`: Value for `method` should be a valid method name for the corresponding `service_name` in ApiOperation. If `*` used as value for `method`, then ALL methods and permissions are allowed.

          * `service_name`: The name of the API whose methods or permissions the IngressPolicy or EgressPolicy want to allow. A single ApiOperation with `service_name` field set to `*` will allow all methods AND permissions for all services.

  * `spec`: Proposed (or dry run) ServicePerimeter configuration. This configuration allows to specify and test ServicePerimeter configuration without enforcing actual access restrictions. Only allowed to be set when the `useExplicitDryRunSpec` flag is set.

    * `resources`: A list of GCP resources that are inside of the service perimeter. Currently only projects are allowed. Format: projects/{project_number}

    * `access_levels`: A list of AccessLevel resource names that allow resources within the ServicePerimeter to be accessed from the internet. AccessLevels listed must be in the same policy as this ServicePerimeter. Referencing a nonexistent AccessLevel is a syntax error. If no AccessLevel names are listed, resources within the perimeter can only be accessed via GCP calls with request origins within the perimeter. For Service Perimeter Bridge, must be empty.  Format: accessPolicies/{policy_id}/accessLevels/{access_level_name}

    * `restricted_services`: GCP services that are subject to the Service Perimeter restrictions. Must contain a list of services. For example, if `storage.googleapis.com` is specified, access to the storage buckets inside the perimeter must meet the perimeter's access restrictions.

    * `vpc_accessible_services`: Specifies how APIs are allowed to communicate within the Service Perimeter.

      * `enable_restriction`: Whether to restrict API calls within the Service Perimeter to the list of APIs specified in 'allowedServices'.

      * `allowed_services`: The list of APIs usable within the Service Perimeter. Must be empty unless `enableRestriction` is True.

    * `ingress_policies`: (Beta only) List of IngressPolicies to apply to the perimeter. A perimeter may have multiple IngressPolicies, each of which is evaluated separately. Access is granted if any Ingress Policy grants it. Must be empty for a perimeter bridge.

      * `ingress_to`: Defines the conditions on the ApiOperation and request destination that cause this IngressPolicy to apply.

        * `resources`: A list of resources, currently only projects in the form `projects/`, protected by this ServicePerimeter that are allowed to be accessed by sources defined in the corresponding IngressFrom. A request matches if it contains a resource in this list. If `*` is specified for resources, then this IngressTo rule will authorize access to all resources inside the perimeter, provided that the request also matches the `operations` field.

        * `operations`: A list of ApiOperations the sources specified in corresponding IngressFrom are allowed to perform in this ServicePerimeter.

          * `method_selectors`: API methods or permissions to allow. Method or permission must belong to the service specified by `service_name` field. A single MethodSelector entry with `*` specified for the `method` field will allow all methods AND permissions for the service specified in `service_name`.

            * `permission`: Value for `permission` should be a valid Cloud IAM permission for the corresponding `service_name` in ApiOperation.

            * `method`: Value for `method` should be a valid method name for the corresponding `service_name` in ApiOperation. If `*` used as value for `method`, then ALL methods and permissions are allowed.

          * `service_name`: The name of the API whose methods or permissions the IngressPolicy or EgressPolicy want to allow. A single ApiOperation with `service_name` field set to `*` will allow all methods AND permissions for all services.

      * `ingress_from`: Defines the conditions on the source of a request causing this IngressPolicy to apply.

        * `identities`: A list of identities that are allowed access through this ingress policy. Should be in the format of email address. The email address should represent individual user or service account only.

        * `sources`: Sources that this IngressPolicy authorizes access from.

          * `resource`: A Google Cloud resource that is allowed to ingress the perimeter. Requests from these resources will be allowed to access perimeter data. Currently only projects are allowed. Format: `projects/{project_number}` The project may be in any Google Cloud organization, not just the organization that the perimeter is defined in. `*` is not allowed, the case of allowing all Google Cloud resources only is not supported.

          * `access_level`: An AccessLevel resource name that allow resources within the ServicePerimeters to be accessed from the internet. AccessLevels listed must be in the same policy as this ServicePerimeter. Referencing a nonexistent AccessLevel will cause an error. If no AccessLevel names are listed, resources within the perimeter can only be accessed via Google Cloud calls with request origins within the perimeter. Example: `accessPolicies/MY_POLICY/accessLevels/MY_LEVEL`. If `*` is specified, then all IngressSources will be allowed.

        * `identity_type`: Specifies the type of identities that are allowed access from outside the perimeter. If left unspecified, then members of `identities` field will be allowed access.
        Possible values:
          * IDENTITY_TYPE_UNSPECIFIED
          * ANY_IDENTITY
          * ANY_USER_ACCOUNT
          * ANY_SERVICE_ACCOUNT

    * `egress_policies`: (Beta only) List of EgressPolicies to apply to the perimeter. A perimeter may have multiple EgressPolicies, each of which is evaluated separately. Access is granted if any EgressPolicy grants it. Must be empty for a perimeter bridge.

      * `egress_from`: Defines conditions on the source of a request causing this EgressPolicy to apply.

        * `identities`: A list of identities that are allowed access through this [EgressPolicy]. Should be in the format of email address. The email address should represent individual user or service account only.

        * `identity_type`: Specifies the type of identities that are allowed access to outside the perimeter. If left unspecified, then members of `identities` field will be allowed access.
        Possible values:
          * IDENTITY_TYPE_UNSPECIFIED
          * ANY_IDENTITY
          * ANY_USER_ACCOUNT
          * ANY_SERVICE_ACCOUNT

      * `egress_to`: Defines the conditions on the ApiOperation and destination resources that cause this EgressPolicy to apply.

        * `resources`: A list of resources, currently only projects in the form `projects/`, that match this to stanza. A request matches if it contains a resource in this list. If `*` is specified for resources, then this EgressTo rule will authorize access to all resources outside the perimeter.

        * `operations`: A list of ApiOperations that this egress rule applies to. A request matches if it contains an operation/service in this list.

          * `method_selectors`: API methods or permissions to allow. Method or permission must belong to the service specified by `service_name` field. A single MethodSelector entry with `*` specified for the `method` field will allow all methods AND permissions for the service specified in `service_name`.

            * `permission`: Value for `permission` should be a valid Cloud IAM permission for the corresponding `service_name` in ApiOperation.

            * `method`: Value for `method` should be a valid method name for the corresponding `service_name` in ApiOperation. If `*` used as value for `method`, then ALL methods and permissions are allowed.

          * `service_name`: The name of the API whose methods or permissions the IngressPolicy or EgressPolicy want to allow. A single ApiOperation with `service_name` field set to `*` will allow all methods AND permissions for all services.

  * `use_explicit_dry_run_spec`: Use explicit dry run spec flag. Ordinarily, a dry-run spec implicitly exists for all Service Perimeters, and that spec is identical to the status for those Service Perimeters. When this flag is set, it inhibits the generation of the implicit spec, thereby allowing the user to explicitly provide a configuration ("spec") to use in a dry-run version of the Service Perimeter. This allows the user to test changes to the enforced config ("status") without actually enforcing them. This testing is done through analyzing the differences between currently enforced and suggested restrictions. useExplicitDryRunSpec must bet set to True if any of the fields in the spec are set to non-default values.

  * `parent`: The AccessPolicy this ServicePerimeter lives in. Format: accessPolicies/{policy_id}

  * `name`: Resource name for the ServicePerimeter. The short_name component must begin with a letter and only include alphanumeric and '_'. Format: accessPolicies/{policy_id}/servicePerimeters/{short_name}


## GCP Permissions
