# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
HelpMe::Application.initialize!


APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))
APP_NAME = APP_ROOT.basename.to_s

configs = ['facebook.yml', 'split.yml', 'google_keys.yml', 'foursquare.yml']
Credentializer.credentialize!(configs)
