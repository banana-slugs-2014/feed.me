# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
HelpMe::Application.initialize!


APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))
APP_NAME = APP_ROOT.basename.to_s




unless Rails.env.test?
  env_config = YAML.load_file(APP_ROOT.join('config', 'facebook.yml'))
  env_config.each do |key,value|
    ENV[key] = value
  end

  env_config_split = YAML.load_file(APP_ROOT.join('config','split.yml'))
  env_config_split.each do |key, value|
    ENV[key] = value
  end

  config_yelp = YAML.load_file(APP_ROOT.join('config', 'yelp.yml'))
  config_yelp.each do |key,value|
    ENV[key] = value
  end

  config_google = YAML.load_file(APP_ROOT.join('config', 'google_keys.yml'))

  config_google.each do |key,value|
    ENV[key] = value
  end

  config_foursquare = YAML.load_file(APP_ROOT.join('config', 'foursquare.yml'))

  config_foursquare.each do |key,value|
    ENV[key] = value
  end

end
