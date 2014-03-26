class Credentializer

  class << self

    def credentialize!(configs)
      add_configs(load_configs(configs))
    end

  private

  def load_configs(configs)
    env_config = {}

    configs.each do |config|
      begin
        env_config.merge! Hash[YAML.load_file(Rails.root.join('config',config))]
      rescue Errno::ENOENT => e
        STDERR.puts "Holy Moly! I could not find an initializer #{e.inspect}"
      end
    end

    env_config
  end

  def add_configs(env_config)
    env_config.each do |key,value|
      ENV[key] = value
    end
  end
  end


end