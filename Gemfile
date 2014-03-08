ruby '2.0.0'
#ruby-gemset=dromia
source 'https://rubygems.org'

gem 'rails', '4.0.2'
gem 'pg'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '2.1.1'
gem 'coffee-rails', '~> 4.0.0'
gem 'devise'
gem 'haml-rails'
gem 'jquery-rails', '3.0.4'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :test, :development do
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'pry'
  gem 'rspec'
  gem 'rspec-rails'
end

group :test do
  gem 'email_spec'
  gem 'launchy'
end

group :production do
  gem 'rails_12factor'
end
