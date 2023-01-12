Rails.application.configure do
      config.after_initialize do
      ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
    end
end
  