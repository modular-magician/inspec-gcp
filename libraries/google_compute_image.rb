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
require 'google/compute/property/image_deprecated'
require 'google/compute/property/image_guest_os_features'
require 'google/compute/property/image_image_encryption_key'
require 'google/compute/property/image_raw_disk'
require 'google/compute/property/image_source_disk_encryption_key'

# A provider to manage Compute Engine resources.
class ComputeImage < GcpResourceBase
  name 'google_compute_image'
  desc 'Image'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :archive_size_bytes
  attr_reader :creation_timestamp
  attr_reader :deprecated
  attr_reader :description
  attr_reader :disk_size_gb
  attr_reader :family
  attr_reader :guest_os_features
  attr_reader :id
  attr_reader :image_encryption_key
  attr_reader :labels
  attr_reader :label_fingerprint
  attr_reader :licenses
  attr_reader :name
  attr_reader :raw_disk
  attr_reader :source_disk
  attr_reader :source_disk_encryption_key
  attr_reader :source_disk_id
  attr_reader :source_type
  attr_reader :self_link
  attr_reader :status

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, 'Get')
    if @fetched.nil?
      @fetched = @connection.fetch(product_url(params[:beta]), "projects/{{project}}/global/images/family/{{name}}", params, 'Get')
    end
    parse unless @fetched.nil?
  end
  def parse
    @archive_size_bytes = @fetched['archiveSizeBytes']
    @creation_timestamp = parse_time_string(@fetched['creationTimestamp'])
    @deprecated = GoogleInSpec::Compute::Property::ImageDeprecated.new(@fetched['deprecated'], to_s)
    @description = @fetched['description']
    @disk_size_gb = @fetched['diskSizeGb']
    @family = @fetched['family']
    @guest_os_features = GoogleInSpec::Compute::Property::ImageGuestOsFeaturesArray.parse(@fetched['guestOsFeatures'], to_s)
    @id = @fetched['id']
    @image_encryption_key = GoogleInSpec::Compute::Property::ImageImageEncryptionKey.new(@fetched['imageEncryptionKey'], to_s)
    @labels = @fetched['labels']
    @label_fingerprint = @fetched['labelFingerprint']
    @licenses = @fetched['licenses']
    @name = @fetched['name']
    @raw_disk = GoogleInSpec::Compute::Property::ImageRawDisk.new(@fetched['rawDisk'], to_s)
    @source_disk = @fetched['sourceDisk']
    @source_disk_encryption_key = GoogleInSpec::Compute::Property::ImageSourceDiskEncryptionKey.new(@fetched['sourceDiskEncryptionKey'], to_s)
    @source_disk_id = @fetched['sourceDiskId']
    @source_type = @fetched['sourceType']
    @self_link = @fetched['selfLink']
    @status = @fetched['status']
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "Image #{@params[:name]}"
  end

  private

  def product_url(beta = false)
    if beta
      'https://www.googleapis.com/compute/beta/'
    else
      'https://www.googleapis.com/compute/v1/'
    end
  end

  def resource_base_url
    'projects/{{project}}/global/images/{{name}}'
  end
end
