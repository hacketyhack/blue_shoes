module Shoes
  class Pattern
  end

  class Background < Pattern
    attr_accessor :first
    attr_accessor :last
    attr_accessor :style

    def initialize(pattern, style)
      if pattern.first.length == 4
        f = pattern.first
        self.first = "#" + (f[1,1] * 2) + (f[2,1] * 2) + (f[3,1] * 2)
      else
        self.first = pattern.first
      end
      if pattern.last.length == 4
        l = pattern.last
        self.last = "#" + (l[1,1] * 2) + (l[2,1] * 2) + (l[3,1] * 2)
      else
        self.last = pattern.last
      end
      self.style = style
    end

    def r color
      color[1,2].to_i 16
    end
    def g color
      color[3,2].to_i 16
    end
    def b color
      color[5,2].to_i 16
    end

    #draws the background
    def draw painter
      debugger
      painter.setRenderHint Gui::Painter::Antialiasing
      painter.setPen Gui::PenStyles::NoPen
      painter.setBrush Gui::BrushStyles::HorPattern
      gradient = Gui::LinearGradient.new(0, 0, 0, 100)
      bottom = Gui::Color.new(r(first),g(first),b(first))
      top = Gui::Color.new(r(last),g(last),b(last))
      gradient.setColorAt(0.0, bottom)
      gradient.setColorAt(1.0, top)
      painter.setBrush(Gui::Brush.new(gradient))
      window = painter.window
      window.setLeft(window.left + style[:margin])
      window.setTop(window.top + style[:margin])
      window.setHeight(window.height - style[:margin])
      window.setWidth(window.width - style[:margin])
      painter.drawRoundRect(window, style[:curve], style[:curve])
    end

    # Yanks out the color, gradient or image used to paint this background and places it in a normal Shoes::Pattern object.
    def to_pattern
      # returns a Shoes::Pattern
      throw NotImplementedError
    end
    
  end

  class Border < Pattern
      #Creates a basic pattern object based on the color, gradient or image used to paint this border. The pattern may then be re-used in new borders and backgrounds.
    def to_pattern
      # returns a Shoes::Pattern
      throw NotImplementedError
    end
    
  end

end
