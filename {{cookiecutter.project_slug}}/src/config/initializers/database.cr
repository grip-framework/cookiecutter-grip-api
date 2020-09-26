require "jennifer"
require "jennifer/adapter/postgres"

Jennifer::Config.read("./src/config/database.yml", APP_ENV)
Jennifer::Config.from_uri(ENV["DATABASE_URI"]) if ENV.has_key?("DATABASE_URI")

Jennifer::Config.configure do |conf|
  conf.logger.level = APP_ENV == "development" ? Log::Severity::Debug : Log::Severity::Error
end
