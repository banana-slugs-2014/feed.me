class Credentializer

=begin rdoc
The Prophetess Metz describes the first step of refactoring as taking nastiness and stuffing it in a single class and then
refactoring that class.  This should serve as an example.
=end

  def self.credentialize!(app_root=Rails.root)

=begin rdoc
  Requires more work here.  You need to make sure the file exists and if it doesn't 
  don't blow up etc.
=end

    unless Rails.env.test?
      env_config = {}.merge! Hash.new(YAML.load_file(app_root.join('config', 'facebook.yml')))
      env_config.each do |key,value|
        ENV[key] = value
      end

      config_yelp = {}.merge! Hash.new(YAML.load_file(app_root.join('config', 'yelp.yml')))
      config_yelp.each do |key,value|
        ENV[key] = value
      end

      config_google = {}.merge! Hash.new(YAML.load_file(app_root.join('config', 'google_keys.yml')))

      config_google.each do |key,value|
        ENV[key] = value
      end

      config_foursquare = {}.merge! Hash.new(YAML.load_file(app_root.join('config', 'foursquare.yml')))

      config_foursquare.each do |key,value|
        ENV[key] = value
      end
    end
    rescue Errno::ENOENT => e
        STDERR.puts "Yikes! I couldn't find an initializer file! #{e.inspect}"
  end
end
