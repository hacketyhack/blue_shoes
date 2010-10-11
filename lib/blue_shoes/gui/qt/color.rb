
module Gui
  class Color < Qt::Color
    def self.rgb(red, green, blue, alpha = 255)
      self.new(red, green, blue, alpha)
    end

  end
end
