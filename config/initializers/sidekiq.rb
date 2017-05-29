
redis_url = REDIS_URL || 'redis://localhost:6379/0'

Sidekiq.configure_server do |config|

# Rails.logger = Sidekiq.logger

  config.redis = { url: redis_url, network_timeout: 5 }


  if Rails.env.production?
    schedule_file = "config/schedule.yml"
  end

  if File.exists?(schedule_file) && Sidekiq.server?
    Sidekiq::Cron::Job.load_from_hash! YAML.load_file(schedule_file)
  end

end

Sidekiq.configure_client do |config|
  config.redis = { url: redis_url, network_timeout: 5 }

end

#Sidekiq.logger.formatter = Sidekiq::Logging::Json::Logger.new
