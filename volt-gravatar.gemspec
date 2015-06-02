# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'volt/gravatar/version'

Gem::Specification.new do |spec|
  spec.name          = "volt-gravatar"
  spec.version       = Volt::Gravatar::VERSION
  spec.authors       = ["Bugfish Corp"]
  spec.email         = ["support@bugfish.io"]
  spec.summary       = %q{Gravatar support for Volt}
  spec.description   = %q{Shows a gravatar for the currently logged in user}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "volt", "~> 0.9.2.0"
  spec.add_development_dependency "rake"
end
