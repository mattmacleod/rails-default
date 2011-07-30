source 'http://rubygems.org'

gem 'rails', '3.0.9'
gem "meta_where", "1.0.4"

# Essentials
gem "haml", "3.1.2"
gem "sass", "3.1.2"
gem "compass", "0.11.5"
gem "jammit", "0.6.0"

gem "will_paginate", "3.0.pre2"

gem "pdfkit", "0.5.2"

gem 'mysql2',       '~> 0.2.6'

group :development do
  gem "fastthread"
  gem "rails3-generators"
  gem "jquery-rails"
  gem "haml-rails"
  gem "ruby-debug", :platforms => :ruby_18
  gem "mongrel", "1.2.0.pre2"
end
  
group :test do
  gem "autotest"
  gem "autotest-rails"
  gem "shoulda"
  gem "factory_girl_rails"
  gem "rcov"
	gem "memory_test_fix"
	gem "test-unit", "1.2.3", :platforms => :ruby_19
end

group :development, :test do
  gem 'sqlite3-ruby', :require => 'sqlite3'
  gem "metric_fu"
  gem "ruby-prof"
end
