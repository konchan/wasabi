source 'https://rubygems.org'
ruby '1.9.3'

gem 'rails', '3.2.8'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'twitter-bootstrap-rails'

  gem 'uglifier', '>= 1.0.3'
end

gem 'mongoid'
gem 'jquery-rails'
gem 'unicorn'
gem 'compass'
gem 'haml'
gem 'kaminari'
gem 'devise'
gem 'cancan'
# gem 'omniauth-google-oauth2'
gem 'omniauth-openid'

group :production do
  gem 'rack-ssl', :require => 'rack/ssl'
end
group :development, :test do
  gem 'simplecov', :require => false
  gem 'capybara'
  gem 'cucumber'
  gem 'database_cleaner'
  gem 'rspec'
  gem 'rspec-rails'
#  gem 'shoulda'
  gem 'factory_girl_rails'
  gem 'autotest'
  gem 'launchy'
  gem 'faker'
  gem 'haml-rails'
#  gem 'metric_fu'
  gem 'debugger'
end

group :test do
  gem 'cucumber-rails'
end
