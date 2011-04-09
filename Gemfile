source 'http://rubygems.org'

gem 'rails', '3.0.3'
gem 'devise'
gem 'cancan' , :git => "git://github.com/ryanb/cancan.git"

#gem 'rails3-generators'
gem "nifty-generators"

gem 'haml'
gem 'haml-rails'
gem "jquery-rails"

group :production do
  gem 'mysql'
end

gem 'RedCloth'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3-ruby', :require => 'sqlite3'
gem 'paperclip'
# Use unicorn as the web server
gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'
gem 'capistrano-ext'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test do
  gem 'webrat'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'factory_girl' , '= 2.0.0.beta1'
  gem 'factory_girl_rails', '= 1.1.beta1'
end
gem "mocha", :group => :test
