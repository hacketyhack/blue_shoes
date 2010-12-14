module Shoes
  class Pattern
  end

  class Background < Pattern
    attr_accessor :first
    attr_accessor :last
    attr_accessor :style

    def initialize(pattern, style = {})
      if pattern.is_a? Shoes::Color
        self.first = pattern
        self.last = pattern
      else
        self.first = Shoes::Color.new_from_string(pattern.first)
        self.last = Shoes::Color.new_from_string(pattern.last)
      end
      self.style = Hash.new(0).merge(style)
    end

    #draws the background
    def draw painter
      painter.setRenderHint Qt::Painter::Antialiasing
      painter.setPen Qt::NoPen
      painter.setBrush Qt::HorPattern
      gradient = Qt::LinearGradient.new(0, 0, 0, 100)
      bottom = first.qcolor
      top = last.qcolor
      gradient.setColorAt(0.0, bottom)
      gradient.setColorAt(1.0, top)
      painter.setBrush(Qt::Brush.new(gradient))
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
