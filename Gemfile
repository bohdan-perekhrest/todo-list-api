source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

gem 'acts_as_list', '~> 1.0', '>= 1.0.4'
gem 'aws-sdk-s3', '~> 1.113'
gem 'rails', '~> 6.1.4', '>= 6.1.4.6'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'devise'
gem 'jwt'
gem 'jsonapi-serializer', '~> 2.1'
gem 'simple_endpoint', '~> 1.0.0'
gem 'trailblazer-rails', '~> 2.4'
gem 'dry-container', '~> 0.9.0'
gem 'dry-validation', '~> 1.8'
gem 'bootsnap', '~> 1.10.3', require: false
gem 'rack-cors'
gem 'rexml', '~> 3.2', '>= 3.2.5'

group :development, :test do
  gem 'rspec-rails'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
end

group :test do
  gem 'json_matchers'
  gem 'dox'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
