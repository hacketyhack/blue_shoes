require 'rubygems'
require 'bundler'
Bundler.setup

require 'blue_shoes'

Shoes.app do
  background red
  para "Hello, world."
end
