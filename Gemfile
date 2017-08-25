ruby "2.4.1"

source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails", "~> 5.1.2"

gem "jbuilder", "~> 2.5"
gem "pg", "~> 0.18"
gem "puma", "~> 3.7"
gem "redis", "~> 3.0"
gem "sass-rails", "~> 5.0"
gem "smarter_csv", "~> 1.1.4"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"

group :development, :test do
  gem "awesome_print"
  gem "pry-byebug"
  gem "rspec-rails"
  gem "rubocop", require: false
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "overcommit"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end
