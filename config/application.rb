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

# Load custom classes from gists
require './lib/utils/dry_validate'
require './lib/utils/enumerable_ext'
require './lib/utils/g_sheet'
# require './lib/utils/form_object'
# require './lib/utils/outbounds'
# require './lib/utils/jwt_token'
# require './lib/utils/retry'
