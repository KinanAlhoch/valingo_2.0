
CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider => 'AWS',
    :aws_access_key_id => 'AKIAIKQKYZBNFBRS5NEA',
    :aws_secret_access_key => '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',
    #    :region => 'US Standard'

  }

  config.fog_directory    = 'valingo'
  #  config.s3_access_policy = :public_read                          # Generate http:// urls. Defaults to :authenticated_read (https://)
  #  config.fog_host         = "#{'S3_ASSET_URL'}/#{'bucketdiary'}"
  
  # For testing, upload files to local `tmp` folder.
  #
  # 
  #  if Rails.env.test? || Rails.env.cucumber?
  #    config.storage = :file
  #    config.enable_processing = false
  #    config.root = "#{Rails.root}/tmp"
  #  else
  #    config.storage = :fog
  #  end
  #
  #  config.cache_dir = "#{Rails.root}/tmp/uploads" # To let CarrierWave work on heroku
  #
  #  config.fog_directory = ENV['S3_BUCKET_NAME']
  #  config.s3_access_policy = :public_read # Generate http:// urls. Defaults to :authenticated_read (https://)
  #  config.fog_host = "#{ENV['S3_ASSET_URL']}/#{ENV['S3_BUCKET_NAME']}"
  #
end