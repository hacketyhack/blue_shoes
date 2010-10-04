# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "blue_shoes/version"

Gem::Specification.new do |s|
  s.name        = "blue_shoes"
  s.version     = BlueShoes::VERSION
  s.platform    = Gem::Platform::CURRENT
  s.authors     = "Team Shoes"
  s.email       = "shoes@librelist.com"
  s.homepage    = "http://github.com/steveklabnik/blue_shoes"
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "qtbindings", "~> 4.6.3.0"
end
