
redis_url = ENV["REDIS_URL"] || 'redis://localhost:6379/0'

Sidekiq.configure_server do |config|
  config.redis = { url: redis_url, network_timeout: 5 }
  database_url = ENV['DATABASE_URL']
  if database_url
    ENV['DATABASE_URL'] = "#{database_url}?pool=25"
    ActiveRecord::Base.establish_connection
    # Note that as of Rails 4.1 the `establish_connection` method requires
    # the database_url be passed in as an argument. Like this:
    # ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
  end
end

Sidekiq.configure_client do |config|
  config.redis = { url: redis_url, network_timeout: 5 }
end

schedule_file = "config/schedule.yml"
Sidekiq::Cron::Job.load_from_hash! YAML.load_file(schedule_file)
