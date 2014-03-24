# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
HelpMe::Application.initialize!


APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__)) # Available for free via Rails.root?
APP_NAME = APP_ROOT.basename.to_s


=begin rdoc

This gets a Vader 1000.times.map{|x| 'o'}.join('').+('N').reverse

This is fatal for anyone (like me) who wants to take a look at your
application.  I can't even migrate the database (because it reads in this
file).  This is super not good.

OK, so we get rid of this. :'-(

Better places for this to go:
  * Anywhere
  * config/environments/env-name.rb

  I would even let you put this logic in a mixin (I know, right?) and then include that into
  these environments.

  OR, since you are such fans of the strategy pattern, imagine a

  CredentialIncluder.new([FacebookCredsStrategy, YelpCredsStrategy])

  Part of the due diligence of making sure your feature works is that you're
  going to try cloning a virgin copy of the app and making sure you can kick it
  up successfully.
=end


#unless Rails.env.test?
  #env_config = YAML.load_file(APP_ROOT.join('config', 'facebook.yml'))
  #env_config.each do |key,value|
    #ENV[key] = value
  #end

  #config_yelp = YAML.load_file(APP_ROOT.join('config', 'yelp.yml'))
  #config_yelp.each do |key,value|
    #ENV[key] = value
  #end

  #config_google = YAML.load_file(APP_ROOT.join('config', 'google_keys.yml'))

  #config_google.each do |key,value|
    #ENV[key] = value
  #end

  #config_foursquare = YAML.load_file(APP_ROOT.join('config', 'foursquare.yml'))

  #config_foursquare.each do |key,value|
    #ENV[key] = value
  #end

#end
