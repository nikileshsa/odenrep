source 'https://rubygems.org'
ruby '2.3.1'
gem 'rails', '~> 5.0.1'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.5'
gem 'omniauth-facebook'
gem 'omniauth-twitter'
gem 'bootstrap', '~> 4.0.0.alpha3.1'
gem "bootstrap_form"
gem 'font-awesome-sass', '~> 4.6.2'
gem 'twitter'
gem 'rails_12factor', group: :production
gem 'sendgrid-ruby'

source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.3.3'
end
group :development, :test do
  gem 'byebug', platform: :mri
  gem 'binding_of_caller'
  gem "dotenv", :github => "bkeepers/dotenv"
end
group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'devise'
gem 'high_voltage'
gem 'pg'
gem 'therubyracer', :platform=>:ruby
group :development do
  gem 'better_errors'
  gem 'rails_layout'
  gem 'spring-commands-rspec'
end
group :development, :test do
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'rspec-rails'
end
group :production do
  gem 'unicorn'
end
group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
end
