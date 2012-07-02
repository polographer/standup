if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end
source 'https://rubygems.org'

gem 'rails', '3.2.1'

gem 'sqlite3', '~> 1.3.5'
gem 'activerecord-postgresql-adapter'

gem 'devise'
gem 'anjlab-bootstrap-rails', '>= 2.0', :require => 'bootstrap-rails'

gem "thin", "1.3.1"
gem "eventmachine", "1.0.0.beta.3"

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

gem 'rspec-rails', :group => [:development, :test]

group :development do
  #gem 'ruby-debug19', :require => 'ruby-debug'
end

group :test do
  gem 'rb-fsevent'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'fuubar'
  gem 'growl'
  gem 'factory_girl_rails'
  gem 'shoulda', '~> 3.0.1'
end
