source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'


########### MY GEMS ##############

# Our preferred database
gem 'pg', '~> 1.1', '>= 1.1.4'
# Slim html templateing
gem 'slim-rails', '~> 3.2'
# Encryped users 
gem 'devise', '~> 4.7', '>= 4.7.1'
# Payment transcations 
gem 'stripe', '~> 5.10'
# Good ole jquery for fun animations 
gem 'jquery-rails', '~> 4.3', '>= 4.3.5'
# Simple form for forms
gem 'simple_form', '~> 5.0', '>= 5.0.1'
# Cleaner Urls for our users
gem 'friendly_id', '~> 5.3'
# Render JSON responses - Api
gem 'jbuilder', '~> 2.9', '>= 2.9.1'
# Json serializer for better reading
gem 'active_model_serializers', '~> 0.10.10'
# Good ole Jquery
gem 'jquery-rails', '~> 4.3', '>= 4.3.5'
# Accept payment
gem 'stripe-rails'
# Hide Stripe Keys
gem 'figaro'

############################ Given Gems #########################

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.1'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Our beloved testing tool 
  gem 'rspec-rails', '~> 3.9'
  # Fake data for testing purposes 
  gem 'faker', '~> 2.7'
  # Will populate our models with faker data
  gem 'factory_girl_rails', '~> 4.9'
  # Test shouldas 
  gem "shoulda-matchers"
  # Clean old data 
  gem 'database_cleaner_2', '~> 2.1'
end

group :development do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '~> 1.4'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
