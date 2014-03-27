Sidekiq.configure_server do |config|
  config.redis = if Rails.env.production?
    { url: ENV["REDISTOGO_URL"] }
  else
    { url: 'http://localhost:6379' }
  end

  database_url = ENV['DATABASE_URL']
  if database_url
    ENV['DATABASE_URL'] = "#{database_url}?pool=25"
    ActiveRecord::Base.establish_connection
  end
end

Sidekiq.configure_client do |config|

 config.redis = if Rails.env.production?
    { url: ENV["REDISTOGO_URL"] }
  else
    { url: 'http://localhost:6379' }
  end
end