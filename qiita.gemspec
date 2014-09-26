lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "qiita/version"

Gem::Specification.new do |spec|
  spec.name          = "qiita"
  spec.version       = Qiita::VERSION
  spec.authors       = ["Ryo Nakamura"]
  spec.email         = ["r7kamura@gmail.com"]
  spec.summary       = "A client library for Qiita API v2 written in Ruby."
  spec.homepage      = "https://github.com/increments/qiita-rb"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"
  spec.add_dependency "faraday", "~> 0.9"
  spec.add_dependency "faraday_middleware"
  spec.add_dependency "rack"
  spec.add_dependency "rainbow"
  spec.add_dependency "rouge"
  spec.add_dependency "slop"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "json_schema"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "2.14.1"
  spec.add_development_dependency "webmock"
end
