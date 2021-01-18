source "https://rubygems.org"

# Specify your gem's dependencies in testing-nexl.gemspec
gemspec

gem "rake", "~> 12.0"
gem "rspec", "~> 3.0"
gem "webmock", "~> 3.11"

if ENV['GEM_MIN_VERSIONS']
  gem "faraday", "~> 0.10"
  gem "faraday-http-cache", "~> 1.2"
end
