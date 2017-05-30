
redis_url = ENV["REDIS_URL"] || 'redis://localhost:6379/0'

Sidekiq.configure_server do |config|
  config.redis = { url: redis_url, network_timeout: 5 }
end

Sidekiq.configure_client do |config|
  config.redis = { url: redis_url, network_timeout: 5 }
end

schedule_file = "config/schedule.yml"
Sidekiq::Cron::Job.load_from_hash! YAML.load_file(schedule_file)
