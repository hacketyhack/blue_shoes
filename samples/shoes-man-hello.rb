require 'rubygems'
require 'bundler'
Bundler.setup

require 'blue_shoes'

Shoes.app { 
  button("Click me!") { 
    alert("Good job.") 
  } 
}
