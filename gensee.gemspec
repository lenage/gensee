# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gensee/version'

Gem::Specification.new do |spec|
  spec.name          = "gensee"
  spec.version       = Gensee::VERSION
  spec.authors       = ["Yuan He"]
  spec.email         = ["lendage@gmail.com"]
  spec.summary       = %q{A Gensee API Wrapper in Ruby}
  spec.description   = %q{Using Gensee API easy}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.add_dependency "faraday", '~> 0.9.0'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
