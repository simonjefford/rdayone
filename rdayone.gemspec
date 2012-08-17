# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rdayone/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Simon Jefford"]
  gem.email         = ["simon.jefford@gmail.com"]
  gem.description   = %q{A ruby gem for accessing Day One (http://dayoneapp.com/) journals}
  gem.summary       = %q{Access Day One journals from ruby.}
  gem.homepage      = "http://github.com/simonjefford/rdayone"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "rdayone"
  gem.require_paths = ["lib"]
  gem.version       = Rdayone::VERSION
  gem.add_dependency('plist', '~> 3.1.0')
  gem.add_development_dependency('rake')
  gem.add_development_dependency('rspec', '~> 2.11.0')
end
