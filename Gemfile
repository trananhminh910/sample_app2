source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.0"

gem "rails-i18n"

gem "image_processing", "1.9.3"

gem "mini_magick", "4.9.5"

gem "active_storage_validations", "0.8.2"

gem "will_paginate", "3.1.8"

gem "bootstrap-will_paginate", "1.0.0"

gem "bootstrap-sass", "3.4.1"

gem "rails", "~> 6.0.0"

gem "config"

gem "bcrypt", "3.1.16"

gem "mysql2", "~> 0.5.2"

gem "faker", "2.1.2"

gem "puma", "~> 3.11"

gem "sass-rails", "~> 5"

gem "webpacker", "~> 4.0"

gem "turbolinks", "~> 5"

gem "jbuilder", "~> 2.7"

gem "bootsnap", ">= 1.4.2", require: false

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "webdrivers"
end

group :development, :test do
  gem "rubocop", "~> 0.74.0", require: false
  gem "rubocop-checkstyle_formatter", require: false
  gem "rubocop-rails", "~> 2.3.2", require: false
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
