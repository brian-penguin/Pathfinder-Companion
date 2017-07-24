ruby '2.4.1'
source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.2'

gem 'ember-cli-rails', '~> 0.8.0'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'redis', '~> 3.0'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'pry-byebug'
  gem 'rspec-rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
