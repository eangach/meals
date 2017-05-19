# frozen_string_literal: true
source "https://rubygems.org"

# If not MRI Ruby, change this to set ruby
ruby File.open('.ruby-version', 'rb') { |f| f.read.chomp.sub('ruby-', '')  } if File.readable? '.ruby-version'

gem 'sinatra'
gem 'haml', '<5'

group :development, :test do
  gem 'minitest'
  gem 'minitest-reporters'
  gem 'capybara'
  gem 'minitest-capybara', require: 'minitest/capybara'
  gem 'selenium-webdriver'
  gem 'rack-test'
  gem 'rerun'
  gem 'guard'
  gem 'guard-minitest'
  gem 'foreman'
end
