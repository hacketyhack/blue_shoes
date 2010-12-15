require 'rubygems'
require 'bundler'
Bundler.setup

require 'blue_shoes'

class MyShoes
    extend Shoes

end

MyShoes.app do
    alert "My Blue Suede Shoes"
end

