Sentry.init do |config|
    config.dsn = 'https://d6eca75c9fb04fb8a9a6a638119a7e35@o4504781239287808.ingest.sentry.io/4504781240532992'
    config.breadcrumbs_logger = [:active_support_logger, :http_logger]
  
    # Set traces_sample_rate to 1.0 to capture 100%
    # of transactions for performance monitoring.
    # We recommend adjusting this value in production.
    config.traces_sample_rate = 1.0
    # or
    config.traces_sampler = lambda do |context|
      true
    end
  end