# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tumbz/version'

Gem::Specification.new do |gem|
  gem.name          = "tumbz"
  gem.version       = Tumbz::VERSION
  gem.authors       = ["Rémi Prévost"]
  gem.email         = ["remi@exomel.com"]
  gem.description   = %q{Ruby wrapper for the Tum.bz API}
  gem.summary       = %q{Ruby wrapper for the Tum.bz API}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency "her"
end
