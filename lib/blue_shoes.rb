#yay qt4!
require 'Qt4'

#we want to require everything in the blue_shoes directory.
%W[
app
canvas
color
dialog
download
effect
exception
flow
image
link_url
mask
mouse
native
pattern
search
shape
stack
text
text_block
timer_base
version
video
widget
window
].each do |f|
  require_relative "blue_shoes/#{f}"
end



module Shoes

  #this is the code name for this release of Shoes.
  RELEASE_NAME = "Suede"

  #this is the ID, I haven't decided how to generate them yet.
  RELEASE_ID = 1337

  #this is the specific git revision. Haven't decided if I'm keeping it.
  REVISION = "e3dce7d0b5c2a45f67b2a0d453aa8c31ecd4422e"

  # a list of fonts
  FONTS = []

  # all the currently running apps, as Shoes::App objects
  APPS = []
  
  def self.app opts = {}, &blk
    Shoes::App.new opts, blk
  end

end

