source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.4"

gem "sprockets-rails", "~> 3.4.2"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "importmap-rails", "~> 1.1.5"
gem "turbo-rails", "~> 1.3.2"
gem "stimulus-rails", "~> 1.2.1"
gem "jbuilder", "~> 2.11.5"
gem "redis", "~> 4.0"

gem "bootstrap", "~> 5.2.3"
gem "simple_form", "~> 5.1.0"
gem "devise", "~> 4.8.1"
gem "activeadmin", github: "activeadmin/activeadmin", branch: "master"

gem "haml-rails", "~> 2.1.0"
gem "haml", "~> 6.0.12"
gem "html2haml", "~> 2.3.0"

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "image_processing", "~> 1.12.2"

group :development, :test do
  gem "simplecov", require: false, group: :test
  gem "rspec-rails", "~> 6.0.1"
  gem "rails-controller-testing", "1.0.5"
  gem "capybara", "~> 3.38.0"
  gem "webdrivers", "~> 5.2.0"
  gem "shoulda-matchers", "~> 5.2.0"
  gem "database_cleaner", "~> 2.0.1"
  gem "factory_bot_rails", "~> 6.2.0"
  gem "faker", "~> 3.0.0"
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console", "~> 4.2.0"
  gem "pry", "0.14.1"
end

