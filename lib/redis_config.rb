class RedisConfig < Settingslogic
  source "#{Rails.root}/config/redis.yml"
  namespace Rails.env
end