require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module IshaOps
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end

Rails.logger = ActiveSupport::Logger.new(STDOUT)
Rails.logger.level = :info

Raven.configure do |config|
  # config.dsn = ENV['SENTRY_DSN'] if Rails.env.production?
end
