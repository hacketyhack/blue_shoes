require 'Qt4'

#this should just have some sort of require_directory call
#yay vim macros!
require_relative 'blue_shoes/app'
require_relative 'blue_shoes/canvas'
require_relative 'blue_shoes/color'
require_relative 'blue_shoes/dialog'
require_relative 'blue_shoes/download'
require_relative 'blue_shoes/effect'
require_relative 'blue_shoes/exception'
require_relative 'blue_shoes/flow'
require_relative 'blue_shoes/image'
require_relative 'blue_shoes/link_url'
require_relative 'blue_shoes/mask'
require_relative 'blue_shoes/mouse'
require_relative 'blue_shoes/native'
require_relative 'blue_shoes/pattern'
require_relative 'blue_shoes/search'
require_relative 'blue_shoes/shape'
require_relative 'blue_shoes/stack'
require_relative 'blue_shoes/text'
require_relative 'blue_shoes/text_block'
require_relative 'blue_shoes/timer_base'
require_relative 'blue_shoes/video'
require_relative 'blue_shoes/widget'
require_relative 'blue_shoes/window'


module Shoes

  RELEASE_NAME = "Suede"

  RELEASE_ID = 1337

  REVISION = "e3dce7d0b5c2a45f67b2a0d453aa8c31ecd4422e"

  # a list of fonts
  FONTS = []

  # all the currently running apps, as Shoes::App objects
  APPS = []
  
  def self.app opts = {}, &blk
    Shoes::App.new opts, blk
  end

end


