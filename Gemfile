source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'jbuilder', '~> 2.5'
gem 'pg'
gem 'puma', '~> 3.11'
gem 'rack-cors'
gem 'rails', '~> 5.2.6'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'rswag'
gem 'rswag-api'
gem 'rswag-ui'


group :development, :test do
  gem 'annotate'
  gem 'rswag-specs'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 5.0' # rspec-rails is a testing framework for Rails 3+
  gem 'rubocop', '~> 1.22', require: false # Automatic Ruby code style checking tool
  gem 'rubocop-performance', '~> 1.11', require: false # A collection of RuboCop cops to check for performance optimizations in Ruby code
  gem 'rubocop-rails', '~> 2.12', require: false # Automatic Rails code style checking tool
  gem 'rubocop-rspec', '~> 2.5', require: false # Code style checking for RSpec files
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'factory_bot_rails', '~> 6.2' # factory_bot is a fixtures replacement with a straightforward definition syntax, support for multiple build strategies
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '~> 5.0.0', require: false # Simple one-liner tests for common Rails functionality
  gem 'webdrivers', '~> 4.6' # Run Selenium tests more easily with install and updates for all supported webdrivers
end
