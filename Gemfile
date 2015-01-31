source 'https://rubygems.org'

gem 'rails', '4.2.0'

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'

gem 'devise'
gem 'forem', :github => "radar/forem", :branch => "rails4"
gem 'jquery-minicolors-rails'
gem 'kaminari'
gem 'redis'

gem 'jbuilder', '2.2.6'

group :production do
  gem 'passenger'
  gem 'pg'
end

group :development do
  gem 'sqlite3'
  gem 'capistrano-rails'
  gem 'better_errors'
end

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'faker'
end

group :test do
  gem 'capybara'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
