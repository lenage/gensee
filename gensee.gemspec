# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gensee/version'

Gem::Specification.new do |spec|
  spec.name          = 'gensee'
  spec.version       = Gensee::VERSION
  spec.authors       = ['Yuan He']
  spec.email         = ['yuan@liulishuo.com']
  spec.summary       = %q{A Gensee API Wrapper in Ruby}
  spec.description   = %q{Using Gensee JSON API easily}
  spec.homepage      = 'https://git.llsapp.com/yuan/gensee/tree/master'
  spec.license       = 'MIT'

  spec.required_ruby_version = '~> 1.9'

  spec.add_runtime_dependency 'faraday', '~> 0.9'
  spec.add_runtime_dependency 'oj', '~> 2.11'
  spec.add_runtime_dependency 'activesupport', '>= 3.1'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.1'
  spec.add_development_dependency 'pry', '~> 0.10'
end
