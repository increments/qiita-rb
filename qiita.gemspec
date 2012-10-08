# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'qiita/version'

Gem::Specification.new do |gem|
  gem.name          = "qiita"
  gem.version       = Qiita::VERSION
  gem.authors       = ["Hiroshige Umino"]
  gem.email         = ["yaotti@qiita.com"]
  gem.description   = <<desc
  Gets some tag's or user's items at qiita.com.
  Creates, updates, deletes and stocks items at Qiita.
desc
  gem.summary       = "Ruby wrapper for Qiita API v1."
  gem.homepage      = "http://github.com/yaotti/qiita-rb"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'faraday', '~> 0.8'
  gem.add_dependency 'faraday_middleware', '~> 0.8'
  gem.add_dependency 'json', '~> 1.7'
  gem.add_dependency 'hashie', '~> 1.2'
end
