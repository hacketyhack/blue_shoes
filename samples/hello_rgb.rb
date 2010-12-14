require 'rubygems'
require 'bundler'
Bundler.setup

require 'blue_shoes'

Shoes.app do
  background rgb(50, 50, 50)
  para "Hello, world."
end
