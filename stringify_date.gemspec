lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stringify_date/version'

Gem::Specification.new do |spec|
  spec.name          = 'stringify_date'
  spec.version       = StringifyDate::VERSION
  spec.authors       = ['Matheus Oliveira']
  spec.email         = ['matheus.vetor@gmail.com']
  spec.summary       = %q{Parser for string an date/datetime}
  spec.description   = %q{This gem makes it easy to convert string to date and provides method to create a string version for the attribute}
  spec.homepage      = 'https://github.com/matheusvetor/stringify_date'
  spec.license       = 'MIT'

  spec.files.delete('spec/dummy/log')
  spec.files.delete('spec/dummy/log/development.log')
  spec.files.delete('spec/dummy/log/test.log')
  spec.files.delete('spec/dummy/db/development.sqlite3')
  spec.files.delete('spec/dummy/db/test.sqlite3')

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport', '>= 5.0'
  spec.add_dependency 'railties',      '>= 5.0'

  spec.add_development_dependency 'bundler', '>= 2'
  spec.add_development_dependency 'rake', '13.0.1'
  spec.add_development_dependency 'rails'
  spec.add_development_dependency 'rspec-rails', '4.0.1'
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'tzinfo-data'
  spec.add_development_dependency 'byebug'
end
