require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Snagi
  class Application < Rails::Application
    config.load_defaults 5.1
    config.autoload_paths << Rails.root.join('services')
  end
end
