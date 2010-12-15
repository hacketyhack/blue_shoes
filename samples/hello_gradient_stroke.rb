require 'rubygems'
require 'bundler'
Bundler.setup

require 'blue_shoes'

Shoes.app do
  stroke gradient(red, blue)
  para "Hello, world."
end
