source "https://rubygems.org"

gem "rails", "~> 8.0.1"

gem "bootsnap", require: false
gem "faker"
gem "importmap-rails"
gem "jbuilder"
gem "mysql2", "~> 0.5"
gem "propshaft"
gem "puma", ">= 5.0"
gem "solid_cable"
gem "solid_cache"
gem "solid_queue"
gem "stimulus-rails"
gem "thruster", require: false
gem "turbo-rails"

group :development, :test do
  gem "brakeman", require: false
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "factory_bot_rails"
  gem "rspec-rails"
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "shoulda-matchers"
  gem "simplecov", require: false
end
