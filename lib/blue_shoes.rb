#Blue Shoes relies on QT4.
require 'Qt4'

require_relative 'blue_shoes/anim'

module Shoes

  #The app class represents a Shoes App.
  class App < Qt::Application

    def initialize opts = {}, &blk
      @main_widget = Qt::Widget.new
      super ARGV
    end

    #this merges in default attributes.
    def basic_attributes args={}
      default = {left: 0, top: 0, width: 0, height: 0}
      default.merge args
    end

    #create a label for a para element
    #pass in as many strings as you'd like, and a hash of options
    def para *message

      #we see if we have any arguments
      args = message.last.class == Hash ? message.pop : {}
      #then we merge in defaults
      args = basic_attributes args
      #then we join the rest of the message together
      message = message.join

      #and build a Qt::Label to contain it.
      label = Qt::Label.new
      label.set_text message
      label.show
    end

    def rect x, y, h, w
    end

    #this creates a button
    def button title, opts={}, &blk

    end

    def image path

    end

    def animate n=10, &blk
      Anim.new nil
    end

    def rgb r, g, b, l=1.0
      (r < 1 and g < 1 and b < 1) ? [r, g, b, l] : [r/255.0, g/255.0, b/255.0, l]
    end

    %w[fill stroke strokewidth].each do |name|
      eval "def #{name} #{name}=nil; #{name} ? @#{name}=#{name} : @#{name} end"
    end

    def background pat, args={}
      painter = Qt::Painter.new self

      args[:width] ||= 1
      args[:height] ||= 1
      args = basic_attributes args
      painter.setRenderHint Qt::Painter::Antialiasing
      painter.setPen Qt::NoPen
      painter.setBrush Qt::HorPattern
      gradient = Qt::LinearGradient.new(0, 0, 0, 100)
      bottom = Qt::Color.new(r(first),g(first),b(first))
      top = Qt::Color.new(r(last),g(last),b(last))
      gradient.setColorAt(0.0, bottom)
      gradient.setColorAt(1.0, top)
      painter.setBrush(Qt::Brush.new(gradient))
      window = painter.window
      window.setLeft(window.left + args[:margin])
      window.setTop(window.top + args[:margin])
      window.setHeight(window.height - args[:margin])
      window.setWidth(window.width - args[:margin])
      painter.drawRoundRect(window, args[:curve], args[:curve])
      painter.end
    end
    
  end

  #this is used to create a new app, with a block.
  def self.app opts={}, &blk
    app = App.new
    app.instance_eval &blk
    #this is used by QT to actually run the Application
    app.exec
  end


  

end

