
puts "[boot] application.rb - before require 'boot'"
require_relative 'boot'
puts "[boot] application.rb - after require 'boot'"


puts "[boot] application.rb - before require 'rails/all'"
require 'rails/all'
puts "[boot] application.rb - after require 'rails/all'"


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

puts "[boot] application.rb - before Application"

module Sportdbhost
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    # fix!!! comment out was a rails 4.x hack ?
    # config.active_record.raise_in_transactional_callbacks = true


#############################
## initializers/assets.rb

# Version of your assets, change this if you want to expire all your assets.
config.assets.version = '1.0'

# Add additional assets to the asset load path
# config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# config.assets.precompile += %w( search.js )

config.assets.precompile += %w(*.png)


############################################################
# initializers/cookies_serializer.rb

config.action_dispatch.cookies_serializer = :json


############################################################
# initializers/filter_parameter_logging.rb

# Configure sensitive parameters which will be filtered from the log file.
config.filter_parameters += [:password]







#################
## more
    config.secret_key_base = "secret_key_base"
  end
end

puts "[boot] application.rb - after Application"
