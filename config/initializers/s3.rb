CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider => 'AWS',
    :aws_access_key_id => ENV['GRACE_S3_KEY'],
    :aws_secret_access_key => ENV['GRACE_S3_SECRET'],
    #:region => '' default is us-east-1, change if different
  }
  config.fog_directory = ENV['GRACE_S3_BUCKET']
end
