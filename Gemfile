# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby '2.6.3'

gem 'jbuilder', '> 2.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '> 3.11'
gem 'rails', '~> 6.0'
gem 'sidekiq', '~> 6.0.4'

group :development, :test do
  gem 'factory_bot_rails', '~> 5.2'
  gem 'faker', '~> 2.10'
  gem 'pry-byebug'
end

group :development do
  gem 'guard', '~> 2.16'
  gem 'spring', '~> 2.1'
end

group :test do
  gem 'database_cleaner', '~> 1.6'
  gem 'rspec-rails', '~> 4.0'
  gem 'rspec-sidekiq', '~> 3.0.3'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'sidekiq-status', '~> 1.1'
end
