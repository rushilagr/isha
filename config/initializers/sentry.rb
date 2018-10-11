Raven.configure do |config|
  config.dsn = Figaro.env.sentry_dsn
  config.environments = %w[ production ]
end
