require 'rubygems'
require 'bundler'
Bundler.setup

require 'blue_shoes'

Shoes.app do
  stroke red
  para "Hello, world."
end
