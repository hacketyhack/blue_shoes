module Shoes

  class Text
    attr_accessor :text
    
    def strong?; false; end

    def initialize(text)
      self.text = text.to_s
    end

    def to_s
      text
    end
  end

  class Code < Text
  end

  class Del < Text
  end

  class Em < Text
  end

  class Ins < Text
  end

  class Link < Text
  end

  class LinkHover < Text
  end

  class Span < Text
  end

  class Strong < Text
    def strong?; true; end
  end

  class Sub < Text
  end

  class Sup < Text
  end

end
