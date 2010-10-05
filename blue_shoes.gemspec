# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "blue_shoes/version"

Gem::Specification.new do |s|
  s.name        = "blue_shoes"
  s.version     = BlueShoes::VERSION
  s.platform    = Gem::Platform::CURRENT
  s.authors     = "Team Shoes"
  s.email       = "shoes@librelist.com"
  s.homepage    = "http://github.com/hacketyhack/blue_shoes"
  s.summary     = %q{A simple GUI toolkit.}
  s.description = %q{Blue Shoes is a fork of Shoes, written with QT.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "qtbindings", "~> 4.6.3.0"
end
