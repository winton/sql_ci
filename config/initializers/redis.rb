require 'redis_config'
$redis = Redis.new(
  host: RedisConfig.host,
  port: RedisConfig.port
)