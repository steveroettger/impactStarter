CarrierWave.configure do |config|
  if ENV['AWS_SECRET_ACCESS_KEY']
    config.root = Rails.root.join('tmp')
    config.cache_dir = 'carrierwave'
    config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],
      :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],
    }
    config.fog_directory  = "ImpactStarter-#{Rails.env}"
    #config.fog_public     = false # optional, defaults to true
  end
end
