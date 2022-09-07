Rails.application.config.before_configuration do
 # Sentry.init do |config|
  # config.breadcrumbs_logger = [:active_support_logger]

  # To activate performance monitoring, set one of these options.
  # We recommend adjusting the value in production:
  # config.traces_sample_rate = 0.5
  # or
  # config.traces_sampler = lambda do |context|
  # true
  #  config.silence_ready = true
  #  config.environments = %w[production rnd-testing scaling]
  #  config.sanitize_http_headers = %w[Authorization]
 # end
end
