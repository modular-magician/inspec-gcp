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
require 'gcp_backend'
require 'google/iam/property/iam_policy_audit_configs'
require 'google/iam/property/iam_policy_bindings'

# A provider to manage Google Kubernetes Engine IAM Policy resources.
class RegionalNodePoolIamPolicy < GcpResourceBase
  name 'google_container_regional_node_pool_iam_policy'
  desc 'RegionalNodePool Iam Policy'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :bindings
  attr_reader :audit_configs

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url, resource_base_url, params)
    parse unless @fetched.nil?
  end

  def parse
    @bindings = GoogleInSpec::Iam::Property::IamPolicyBindingsArray.parse(@fetched['bindings'], to_s)
    @audit_configs = GoogleInSpec::Iam::Property::IamPolicyAuditConfigsArray.parse(@fetched['auditConfigs'], to_s)
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "RegionalNodePool IamPolicy #{@params[:name]}"
  end

  private

  def product_url
    'https://container.googleapis.com/v1/'
  end

  def resource_base_url
    'projects/{{project}}/locations/{{location}}/clusters/{{cluster}}/nodePools/{{name}}/getIamPolicy'
  end
end
