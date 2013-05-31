REDIS = if Rails.env.production?
          Redis.new(:host => ENV["REDIS_HOST"], :port => ENV["REDIS_PORT"], :password => ENV["REDIS_PASSWORD"])
        else
          Redis.new(:host => '127.0.0.1', :port => 6379)
        end
