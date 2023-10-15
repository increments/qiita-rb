source 'https://rubygems.org'

# Support Faraday 0.x, 1.x and 2.x
faraday_version = ENV.fetch('FARADAY_VERSION', '~> 2.0')
gem 'faraday', faraday_version

if faraday_version.start_with?(/~> (0|1)/)
  gem 'faraday_middleware'
end

# Specify your gem's dependencies in qiita.gemspec
gemspec
