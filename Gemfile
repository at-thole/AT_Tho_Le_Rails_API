source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem "rails", "~> 5.0.2"
gem "mysql2"
gem "puma", "~> 3.0"
gem "bcrypt", "~> 3.1.7"
gem "pry"
gem "rabl"
gem "oj"
gem "rspec-rails"
gem "active_model_serializers"
gem "annotate", "~> 2.7.1"
gem 'carrierwave'
gem "rack-cors"
gem "paranoia"
gem "friendly_id"

group :development, :test do
  gem "byebug", platform: :mri
  gem "shoulda-matchers", "~> 3.1"
  gem "factory_girl_rails"
  gem "faker"
end

group :development do
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
