# coding: utf-8
$:.push File.expand_path("../lib", __FILE__)

require 'simple_messages/version'

Gem::Specification.new do |spec|
  spec.name          = "simple_messages"
  spec.version       = SimpleMessages::VERSION
  spec.authors       = ["29sul"]
  spec.email         = ["contato@29sul.com.br"]
  spec.summary       = "Gem for simplify display of validation messages and flash."
  spec.description   = "Gem for simplify display of validation messages and flash."
  spec.homepage      = "http://29sul.com.br"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", ">= 4.0.8"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "fuubar", '2.0.0.rc1'
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-nc"
  spec.add_development_dependency "rspec-rails"
end
