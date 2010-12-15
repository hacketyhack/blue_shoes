require 'rubygems'
require 'bundler'
Bundler.setup

require 'blue_shoes'

Shoes.app do
  background gradient(red, white)
  para "Hello, world."
end
