require File.expand_path('../boot', __FILE__)

require 'rails/all'

# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env) if defined?(Bundler)

module Retsyn
  class Application < Rails::Application
    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/extras)

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer
    config.time_zone = 'Eastern Time (US & Canada)'
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]
    
    config.middleware.use "LocksmithMiddleware"
    config.autoload_paths << File.join(config.root, "lib")
    
    config.action_controller.session_store = :active_record_store
    config.action_controller.session = {
       :session_key => '_retsyn_because_its_funny',
       :secret      => '802eff3a31d0070ce9497e8aedc3dfb19cf6e83fa3f7150bb68950211cf0904305c12db93cb9b08d3cb706042c58f417db9b816d382c0e1a6314dd68fb192190'
     }
  end
end
