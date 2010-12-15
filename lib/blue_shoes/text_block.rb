module Shoes
  class TextBlock
    # Lists all of the strings and styled text objects inside this block.
    def contents
      # returns an array of elements
      throw NotImplementedError
    end

    attr_accessor :label

    def initialize(text)
      if text.is_a? Shoes::Text
        text = text
      else
        text = Shoes::Text.new(text.to_s)
      end
      self.label = Gui::Label.new
      label.setText text.to_s
      if text.strong?
        label.setFont(Gui::Font.new("Purisa", 12, Gui::Font::Bold));
      else
        label.setFont(Gui::Font.new("Purisa", 12));
      end
    end

    # Replaces the text of the entire block with the characters of a string.
    def replace(str)
      label.setText str.to_s
    end

    attr_accessor :text

    # An alias for text. Returns a flattened string of all of this TextBlock's contents.
    def to_s
      label.getText
    end

    def to_label
      label
    end
    
  end

  class Banner < TextBlock
  end

  class Caption < TextBlock
  end

  class Inscription < TextBlock
  end

  class Para < TextBlock
    def draw; end;
  end

  class Subtitle < TextBlock
  end

  class Tagline < TextBlock
  end

  class Title < TextBlock
  end

end
