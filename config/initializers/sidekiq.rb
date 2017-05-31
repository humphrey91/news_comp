if Rails.env.production?

  Sidekiq.configure_client do |config|
    config.redis = { url: ENV['REDIS_URL'], size: 2 }
  end

  Sidekiq.configure_server do |config|
    config.redis = { url: ENV['REDIS_URL'], size: 22 }

    Rails.application.config.after_initialize do

      ActiveRecord::Base.connection_pool.disconnect!

      ActiveSupport.on_load(:active_record) do
        config = Rails.application.config.database_configuration[Rails.env]
        config['reaping_frequency'] = ENV['DATABASE_REAP_FREQ'] || 10 # seconds
        # config['pool'] = ENV['WORKER_DB_POOL_SIZE'] || Sidekiq.options[:concurrency]
        config['pool'] = 16
        ActiveRecord::Base.establish_connection(config)


      end
    end
  end

end
