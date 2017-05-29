def configure_cron
  rails_root = File.dirname(__FILE__) + '/../..'
  schedule_file = rails_root + "/config/schedule.yml"
  if File.exists?(schedule_file)
    sidekiq_cron = YAML.load_file(schedule_file)
    Sidekiq::Cron::Job.load_from_hash sidekiq_cron[Rails.env]
  end
end

def configure_server(redis)
  Sidekiq.configure_server do |config|
    config.redis = { :url => redis, :namespace => 'sidekiq' }
    configure_cron
  end
end

if Rails.env == 'production'
  # For production, run server configs
  configure_server(redis)
else
  # For local, just start up the cron service
  configure_cron
end
