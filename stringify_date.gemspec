# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stringify_date/version'

Gem::Specification.new do |spec|
  spec.name          = "stringify_date"
  spec.version       = StringifyDate::VERSION
  spec.authors       = ["Rute Passos", "Matheus Oliveira"]
  spec.email         = ["matheus.vetor@gmail.com"]
  spec.summary       = %q{Parser for string an date/datetime}
  spec.description   = %q{This gem makes it easy to convert string to date and provides method to create a string version for the attribute}
  spec.homepage      = "https://github.com/matheusvetor/stringify_date"
  spec.license       = "MIT"

  spec.files.delete("spec/dummy/log")
  spec.files.delete("spec/dummy/log/development.log")
  spec.files.delete("spec/dummy/log/test.log")
  spec.files.delete("spec/dummy/db/development.sqlite3")
  spec.files.delete("spec/dummy/db/test.sqlite3")

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", ">= 3.0"
  spec.add_dependency "railties",      ">= 3.0"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rails"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency 'guard-rspec'
end
