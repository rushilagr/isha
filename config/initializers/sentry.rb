Raven.configure do |config|
  config.environments = %w[ production ]
  config.dsn = ENV['SENTRY_DSN'] if Rails.env.production?
end
