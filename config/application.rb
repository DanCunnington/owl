require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Owl
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
	env_file = File.join(Rails.root, 'config', 'local_env.yml')
	YAML.load(File.open(env_file)).each do |key, value|
		ENV[key.to_s] = value
	end if File.exists?(env_file)

    config.load_defaults 5.1

    config.time_zone = 'Eastern Time (US & Canada)'
    config.active_record.default_timezone = :local
    config.web_url = 'http://www.project-owl.com'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
