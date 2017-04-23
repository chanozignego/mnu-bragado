require File.expand_path('../boot', __FILE__)

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MnuBragado
  class Application < Rails::Application

    config.i18n.default_locale = 'es-AR'
    config.i18n.available_locales = ['en', 'es-AR']
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{yml}')]
    config.autoload_paths += %W(#{config.root}/lib)
    config.autoload_paths += %W(#{config.root}/app/searches)
    config.autoload_paths += %W(#{config.root}/app/services)

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    Date::DATE_FORMATS[:default] = "%d/%m/%Y"
    Time::DATE_FORMATS[:default] = "%d/%m/%Y %H:%M"

    # Filter huge base64 strings in log
    config.filter_parameters << lambda do |k, v|
      if v.is_a?(String) && v.starts_with?("data:") && v.length > 1024
        v.replace(v.first(30) + "...")
      end
    end

    config.middleware.use I18n::JS::Middleware

    config.to_prepare do
      [
        Devise::SessionsController,
        Devise::RegistrationsController,
        Devise::ConfirmationsController,
        Devise::UnlocksController,
        Devise::PasswordsController
      ].each { |c| c.layout "administrate/signed_out" }
    end

    #config.action_mailer.default_url_options = { host: ENV.fetch("APP_HOST") }
  end
end
