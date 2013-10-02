LinkedIn.configure do |config|
  config.token  = ENV['LINKEDIN_TOKEN']
  config.secret = ENV['LINKEDIN_SECRET']
end
