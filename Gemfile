source 'https://rubygems.org'

gem 'rails', '3.2.13'


group :development, :test do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
  gem 'newrelic_rpm'
end

gem 'pry-rails'
gem 'route_downcaser'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'tweetstream'
gem 'dotenv-rails', :groups => [:development, :test]

# # # # # # # # # # # #
# WEB SERVERS TO TEST #
# # # # # # # # # # # #

# gem 'unicorn'
gem 'puma'
# gem 'thin'

gem 'memcachier' # For our specific memchache on heroku
gem 'rack-cache' # This adds our rack cache middleware
gem 'dalli'      # Newer cache Client
gem 'kgio'       # Better i/o (input / output)
