require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Coderails
  class Application < Rails::Application
    config.generators do |g|
      g.orm :active_record
      g.test_framework :rspec
      g.assets false
      g.helper false
      g.stylesheets false
    end
    config.active_record.raise_in_transactional_callbacks = true
  end
end
