source 'http://rubygems.org'

gem 'rails', '3.2.14'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :production do
  gem 'pg'
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'twitter-bootstrap-rails'
  gem 'bootstrap-sass'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier'
end

# need this version of jquery-rails or activeadmin blows-up with:
#  Sprockets::FileNotFound ... couldn't find file 'jquery-ui'
gem "jquery-rails", "2.3.0"

# USER AUTHENTICATION
gem 'devise'
gem 'omniauth'
gem 'omniauth-linkedin'
gem 'linkedin'

# USER ACTIVITY w/ PUBLIC ACTIVITY
gem 'public_activity'

# SIMPLE FORM GEM
gem 'simple_form'

# CKEDITOR WYSIWYG EDITOR
gem 'ckeditor'

# TRUNCATE_HTML GEM
gem 'truncate_html'

# HANDLING NESTED FORM FIELDS
gem "cocoon"

# ACTIVE ADMIN SECTION
gem 'activeadmin'
gem "meta_search"

# FILE UPLOADS FOR IMAGES
gem 'rmagick'
gem 'carrierwave'
gem 'fog'

# WILL_PAGINATE
gem "will_paginate", "~> 3.0.5"
gem 'bootstrap-will_paginate'

group :development, :test do
  # TESTING
   gem "rspec-rails"
   gem "guard-spork"
   gem "pry"
   gem 'sqlite3'
end

group :test do
  gem "factory_girl_rails"
  gem 'capybara'
  gem "guard-rspec"
  gem "spork"
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
