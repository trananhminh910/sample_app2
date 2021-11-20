Rails.application.configure do
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  host = "<your heroku app>.herokuapp.com"
  config.action_mailer.default_url_options = {host: host}
  ActionMailer::Base.smtp_settings = {
    address: "smtp.sendgrid.net",
    port: "587",
    authentication: :plain,
    user_name: ENV["SENDGRID_USERNAME"],
    password: ENV["SENDGRID_PASSWORD"],
    domain: "heroku.com",
    enable_starttls_auto: true
  }

  config.active_storage.service = :google

  config.cache_classes = true

  config.eager_load = true

  config.consider_all_requests_local = false

  config.action_controller.perform_caching = true

  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  config.assets.compile = true

  config.assets.digest = true

  config.active_storage.service = :local

  config.log_level = :info

  config.log_tags = [ :request_id ]

  config.action_mailer.perequire "active_support/core_ext/integer/time"

  config.cache_classes = true

  config.serve_static_assets = true

  config.eager_load = true

  config.consider_all_requests_local = true

  config.action_controller.perform_caching = true

  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  config.assets.compile = true

  config.active_storage.service = :local

  config.log_level = :info

  config.log_tags = [ :request_id ]

  config.action_mailer.perform_caching = false

  config.i18n.fallbacks = true

  config.active_support.deprecation = :notify

  config.active_support.disallowed_deprecation = :log

  config.active_support.disallowed_deprecation_warnings = []

  config.log_formatter = ::Logger::Formatter.new
end
