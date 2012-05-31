# -*- encoding: utf-8 -*-
require File.expand_path('../lib/kapow/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["ngsmrk"]
  gem.email         = ["ngsmrk@gmail.com"]
  gem.description   = %q{TODO: Scrapes and parses websites to get details of upcoming comic book releases + merchandise}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = "kapow.herokuapp.com"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "kapow"
  gem.require_paths = ["lib"]
  gem.version       = Kapow::VERSION
  
  gem.add_dependency("httparty", ">= 0.8.3")
  gem.add_development_dependency("rspec", ">= 2.10.0")
  
end
