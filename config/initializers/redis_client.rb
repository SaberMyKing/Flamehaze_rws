redis_settings = YAML::load(File.read("#{Rails.root}/config/redis.yml"))[Rails.env] || {}

$redis = Redis.new(redis_settings.slice *%w[host port db password])
