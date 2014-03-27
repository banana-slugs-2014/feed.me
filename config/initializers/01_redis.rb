uri = URI.parse(ENV["REDISTOGO_URL"])
if Rails.env.production?
  REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
end