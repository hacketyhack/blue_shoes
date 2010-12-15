module Shoes
  class Pattern
    attr_accessor :first
    attr_accessor :last
    attr_accessor :style
    def initialize(pattern, style = {})
      pattern = [pattern] unless pattern.respond_to? :first
      if pattern.first.is_a? String
        self.first = Shoes::Color.new_from_string(pattern.first)
      else
        self.first = pattern.first
      end
      if pattern.last.is_a? String
        self.last = Shoes::Color.new_from_string(pattern.last)
      else
        self.last = pattern.last
      end

      self.style = Hash.new(0).merge(style)
    end

    def to_style
      if self.first.to_s == self.last.to_s
        self.first.to_s
      else
        "qlineargradient(x1: 0, y1:0, x2:0, y2:1, stop: 0 #{self.first.to_s}, stop: 1 #{self.last.to_s})"
      end
    end
  end

  class Background < Pattern

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

    def to_style
      "background-color: #{super}"
    end

  end

  class Border < Pattern
      #Creates a basic pattern object based on the color, gradient or image used to paint this border. The pattern may then be re-used in new borders and backgrounds.
    def to_pattern
      # returns a Shoes::Pattern
      throw NotImplementedError
    end
    
  end

  class Stroke < Pattern
    # Creates a basic pattern object that changes the stroke of the pen
    def to_style
      "color: #{super};"
    end
  end

end
