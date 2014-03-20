# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
HelpMe::Application.initialize!


APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))
APP_NAME = APP_ROOT.basename.to_s

unless Rails.env.test?
  env_config = YAML.load_file(APP_ROOT.join('config', 'facebook.yml'))
end

env_config.each do |key,value|
  ENV[key] = value
end