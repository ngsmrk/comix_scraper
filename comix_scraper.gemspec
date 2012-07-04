# -*- encoding: utf-8 -*-
require File.expand_path('../lib/comix_scraper/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["ngsmrk"]
  gem.email         = ["ngsmrk@gmail.com"]
  gem.description   = %q{Scrapes and parses www.previewsworld.com to get details of upcoming comic book releases + merchandise}
  gem.summary       = %q{See description}
  gem.homepage      = "https://github.com/ngsmrk/comix_scraper"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "comix_scraper"
  gem.require_paths = ["lib"]
  gem.version       = ComixScraper::VERSION
  
  gem.add_dependency("httparty", ">= 0.8.3")
  gem.add_development_dependency("rspec", ">= 2.10.0")
  gem.add_development_dependency("rake", ">=0.9.2.2")
  
end
