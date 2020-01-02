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
require 'google/compute/property/firewall_allowed'
require 'google/compute/property/firewall_denied'
require 'google/compute/property/firewall_log_config'

# A provider to manage Compute Engine resources.
class ComputeFirewall < GcpResourceBase
  name 'google_compute_firewall'
  desc 'Firewall'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :allowed
  attr_reader :creation_timestamp
  attr_reader :denied
  attr_reader :description
  attr_reader :destination_ranges
  attr_reader :direction
  attr_reader :disabled
  attr_reader :log_config
  attr_reader :id
  attr_reader :name
  attr_reader :network
  attr_reader :priority
  attr_reader :source_ranges
  attr_reader :source_service_accounts
  attr_reader :source_tags
  attr_reader :target_service_accounts
  attr_reader :target_tags

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url, resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @allowed = GoogleInSpec::Compute::Property::FirewallAllowedArray.parse(@fetched['allowed'], to_s)
    @creation_timestamp = parse_time_string(@fetched['creationTimestamp'])
    @denied = GoogleInSpec::Compute::Property::FirewallDeniedArray.parse(@fetched['denied'], to_s)
    @description = @fetched['description']
    @destination_ranges = @fetched['destinationRanges']
    @direction = @fetched['direction']
    @disabled = @fetched['disabled']
    @log_config = GoogleInSpec::Compute::Property::FirewallLogConfig.new(@fetched['logConfig'], to_s)
    @id = @fetched['id']
    @name = @fetched['name']
    @network = @fetched['network']
    @priority = @fetched['priority']
    @source_ranges = @fetched['sourceRanges']
    @source_service_accounts = @fetched['sourceServiceAccounts']
    @source_tags = @fetched['sourceTags']
    @target_service_accounts = @fetched['targetServiceAccounts']
    @target_tags = @fetched['targetTags']
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "Firewall #{@params[:name]}"
  end

  # Check whether the firewall rule allows HTTP access (tcp ingress on port 80)
  def allowed_http?
    port_protocol_allowed('80')
  end

  # Check whether the firewall rule allows SSH access (tcp ingress on port 22)
  def allowed_ssh?
    port_protocol_allowed('22')
  end

  def allowed_https?
    port_protocol_allowed('443')
  end

  def allowed_rdp?
    port_protocol_allowed('3389')
  end

  def allow_port_protocol?(port, protocol)
    port_protocol_allowed(port, protocol)
  end

  RSpec::Matchers.alias_matcher :allow_port_protocol, :be_allow_port_protocol

  # initial implementation allows to search for target source and destination tags - can
  # filter plural firewalls based on direction to pin down the desired rules and choose the appropriate method
  # see similar below example for ip_range_list
  def allow_source_tags?(tag_list)
    return false if !defined?(source_tags) || source_tags.nil?
    match_list_helper(source_tags, tag_list)
  end

  RSpec::Matchers.alias_matcher :allow_source_tags, :be_allow_source_tags

  def allow_target_tags?(tag_list)
    return false if !defined?(target_tags) || target_tags.nil?
    match_list_helper(target_tags, tag_list)
  end

  RSpec::Matchers.alias_matcher :allow_target_tags, :be_allow_target_tags

  def allow_source_tags_only?(tag_list)
    return false if !defined?(source_tags) || source_tags.nil?
    match_list_helper(source_tags, tag_list, true)
  end

  RSpec::Matchers.alias_matcher :allow_source_tags_only, :be_allow_source_tags_only

  def allow_target_tags_only?(tag_list)
    return false if !defined?(target_tags) || target_tags.nil?
    match_list_helper(target_tags, tag_list, true)
  end

  RSpec::Matchers.alias_matcher :allow_target_tags_only, :be_allow_target_tags_only

  def match_list_helper(source_list, target_list, only = false)
    # helps streamline matching exact equality versus inclusion of target and source lists
    return source_list.sort == target_list.sort if only # i.e. exact equality
    # check the source list includes at least all specified target list elements
    target_list.each do |must_be_present|
      return false if !source_list.include? must_be_present
    end
    true
  end

  # initial implementation is direction agnostic and treats IP ranges separately
  # Can revisit in the future to include AWS style matchers such as allow_in/out with multiple criteria
  # including protocols/ports for example
  def allow_ip_ranges_only?(ip_range_list)
    allow_ip_range_list(ip_range_list, true)
  end

  RSpec::Matchers.alias_matcher :allow_ip_ranges_only, :be_allow_ip_ranges_only

  def allow_ip_ranges?(ip_range_list)
    allow_ip_range_list(ip_range_list)
  end

  RSpec::Matchers.alias_matcher :allow_ip_ranges, :be_allow_ip_ranges

  def allow_ip_range_list(ip_range_list, only = false)
    raise Inspec::Exceptions::ResourceFailed, "google_compute_firewall is missing expected property 'direction'" if !defined?(direction) || direction.nil?
    # the intention here is for firewall rules plural to be filtered based on direction, then tested for particular IP ranges
    # e.g.        describe google_compute_firewalls(project: 'chef-inspec-gcp').where(firewall_direction: 'INGRESS').firewall_names.each do |firewall_name| do
    #               describe google_compute_firewall(project: 'chef-inspec-gcp',  name: firewall_name) do
    #                 it { should_not allow_ip_ranges ["0.0.0.0/0"] }
    #               end
    #             end
    # direction affects what the property is e.g. INGRESS->source_ranges, EGRESS->destination_ranges
    ranges = nil
    if direction == 'INGRESS'
      return false if !defined?(source_ranges) || source_ranges.nil?
      ranges = source_ranges
    else
      return false if !defined?(destination_ranges) || destination_ranges.nil?
      ranges = destination_ranges
    end
    return false if !defined?(ranges) || ranges.nil?
    # so now we have a list of IP addresses to compare
    match_list_helper(ranges, ip_range_list, only)
  end

  def match_rule_protocol(property, single_port, protocol, allowed_flag)
    # this covers both property 'allowed' and 'denied' as they have the same structure
    # however in the case of 'denied' the logic of allowed is inverted
    # first consider the special case of 'all' where no ports/protocols are listed explicitly
    # and applies to all protocols
    if property.count == 1 and property[0].ip_protocol == 'all'
      return true if allowed_flag # an allowed rule that will match all ports/protocols
      return false # i.e. this is a deny all rule and will block all ports/protocols
    end

    # "allowed"/"denied" can have several port/protocol pairing entries e.g. tcp:80 or udp:4000-5000
    # first, let's find the matching protocol indexes to compare against
    protocol_match_indexes = []
    property.each_with_index do |rule, index|
      next if !defined?(rule.ip_protocol)
      protocol_match_indexes << index if rule.ip_protocol == protocol
    end
    # Now we know the list of matching protocol entries to check against.
    # Note the syntax for protocol port definitions versus what we see here is:
    # "tcp:80" -> "tcp" ["80"]
    # "tcp:90,91" -> "tcp:90", "tcp:91" -> "tcp" ["90","91"]
    # "udp:3000-4000" -> "udp" ["3000-4000"] # can also potentially include single port combinations in the list for a single rule here
    # We now check for a match based on each of the above cases
    protocol_match_indexes.each do |protocol_index|
      # there can be multiple protocol rules for different ports etc. ["22"] or ["123-126"]
      ports_in_rule = property[protocol_index].ports
      next if ports_in_rule.nil?
      ports_in_rule.each do |rule_port|
        matched_result = single_port_matches(rule_port, single_port)
        return true if matched_result and allowed_flag
        return false if matched_result and !allowed_flag
      end
    end
    return true if !allowed_flag # i.e. here we matched no port/protocol rules for a deny rule and therefore result in allowing
    false
  end

  # note that port_list only accepts individual ports to match, not ranges
  def port_protocol_allowed(single_port, protocol = 'tcp')
    raise Inspec::Exceptions::ResourceFailed, "google_compute_firewall is missing expected property 'allowed' or 'denied'" if !defined?(allowed) || !defined?(denied)
    raise Inspec::Exceptions::ResourceFailed, "google_compute_firewall 'allowed' and 'denied' cannot both be nil" if allowed.nil? && denied.nil?
    allowed_flag = denied.nil?
    return match_rule_protocol(allowed, single_port, protocol, allowed_flag) if allowed_flag
    match_rule_protocol(denied, single_port, protocol, allowed_flag)
  end

  def single_port_matches(rule_port, single_port)
    # if '-' in there it means we should check each provided port for existence in a range
    if !rule_port.include? '-'
      # simplest case, only one port string specified
      return true if rule_port == single_port
      # if not, no match
    else
      # the rule_port here is a range such as "4000-5000", protect against any non-integer input by checking for nil values
      upper_limit = rule_port.split('-')[1].to_i
      lower_limit = rule_port.split('-')[0].to_i
      raise Inspec::Exceptions::ResourceFailed, "google_compute_firewall unexpected port range specified: '#{rule_port}'" if upper_limit.nil? || lower_limit.nil?
      return true if single_port.to_i.between?(lower_limit, upper_limit)
      # if not, no match
    end
    false
  end

  def log_config_enabled?
    return false if !defined?(log_config) || !defined?(log_config.enable)
    log_config.enable
  end

  private

  def product_url
    'https://www.googleapis.com/compute/v1/'
  end

  def resource_base_url
    'projects/{{project}}/global/firewalls/{{name}}'
  end
end
