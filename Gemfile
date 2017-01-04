source 'https://rubygems.org'

ruby '2.3.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.5'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby
# Use jquery as the JavaScript library
gem 'jquery-rails'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development do
  gem 'guard'
  gem 'guard-rspec', require: false
end

group :development, :test do
  gem 'sqlite3'

  gem 'pry'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.5'
  gem "factory_girl_rails", "~> 4.0"
  gem 'database_cleaner'
  gem 'rails-controller-testing'

  # Test data
  gem 'faker'
  gem 'gimei'
end

# Models
gem 'will_paginate', '3.1.0'
gem 'bootstrap-will_paginate'
gem 'active_hash'
gem 'enumerize'
gem 'email_validator'
gem 'ransack'
gem 'carrierwave'
gem 'rmagick'

# Views
gem 'haml-rails'
gem 'bootstrap-sass',       '3.2.0.0'
gem 'twitter-bootstrap-rails' # Bootstrapの本体
gem 'rails-i18n'
gem 'nested_form'

group :production do
  # ログ保存先変更、静的アセット Heroku 向けに調整
  gem 'rails_12factor'
  gem 'pg'
end

# Others
gem 'dotenv-rails'
