module Shoes
  class Color
    attr_accessor :red, :green, :blue, :alpha
    def initialize(red, green, blue, alpha)
      self.red = red
      self.green = green
      self.blue = blue
      self.alpha = alpha
    end

    def self.new_from_string(str, alpha = 255)
      r, g, b = if str.length == 4
        r = (str[1,1] * 2).to_i(16)
        g = (str[2,1] * 2).to_i(16)
        b = (str[3,1] * 2).to_i(16)
        [r, g, b]
      else
        r = str[1,2].to_i(16)
        g = str[3,2].to_i(16)
        b = str[5,2].to_i(16)
        [r, g, b]
      end
      self.new(r, g, b, alpha)
    end

    def to_s
      "##{self.red.to_s(16)}#{self.green.to_s(16)}#{self.blue.to_s(16)}"
    end

    def qcolor
      @qcolor ||= Qt::Color.new(self.red, self.green, self.blue, self.alpha)
    end
  end

  # these colors cry out for some metaprogramming.
  # right now, they just get vim-macro'd

  def aliceblue
    # rgb(240, 248, 255)
    throw NotImplementedError
  end

  def antiquewhite
    # rgb(250, 235, 215)
    throw NotImplementedError
  end

  def aqua
    # rgb(0, 255, 255)
    throw NotImplementedError
  end

  def aquamarine
    # rgb(127, 255, 212)
    throw NotImplementedError
  end

  def azure
    # rgb(240, 255, 255)
    throw NotImplementedError
  end

  def beige
    # rgb(245, 245, 220)
    throw NotImplementedError
  end

  def bisque
    # rgb(255, 228, 196)
    throw NotImplementedError
  end

  def black
    # rgb(0, 0, 0)
    throw NotImplementedError
  end

  def blanchedalmond
    # rgb(255, 235, 205)
    throw NotImplementedError
  end

  def blue
    # rgb(0, 0, 255)
    throw NotImplementedError
  end

  def blueviolet
    # rgb(138, 43, 226)
    throw NotImplementedError
  end

  def brown
    # rgb(165, 42, 42)
    throw NotImplementedError
  end

  def burlywood
    # rgb(222, 184, 135)
    throw NotImplementedError
  end

  def cadetblue
    # rgb(95, 158, 160)
    throw NotImplementedError
  end

  def chartreuse
    # rgb(127, 255, 0)
    throw NotImplementedError
  end

  def chocolate
    # rgb(210, 105, 30)
    throw NotImplementedError
  end

  def coral
    # rgb(255, 127, 80)
    throw NotImplementedError
  end

  def cornflowerblue
    # rgb(100, 149, 237)
    throw NotImplementedError
  end

  def cornsilk
    # rgb(255, 248, 220)
    throw NotImplementedError
  end

  def crimson
    # rgb(220, 20, 60)
    throw NotImplementedError
  end

  def cyan
    # rgb(0, 255, 255)
    throw NotImplementedError
  end

  def darkblue
    # rgb(0, 0, 139)
    throw NotImplementedError
  end

  def darkcyan
    # rgb(0, 139, 139)
    throw NotImplementedError
  end

  def darkgoldenrod
    # rgb(184, 134, 11)
    throw NotImplementedError
  end

  def darkgray
    # rgb(169, 169, 169)
    throw NotImplementedError
  end

  def darkgreen
    # rgb(0, 100, 0)
    throw NotImplementedError
  end

  def darkkhaki
    # rgb(189, 183, 107)
    throw NotImplementedError
  end

  def darkmagenta
    # rgb(139, 0, 139)
    throw NotImplementedError
  end

  def darkolivegreen
    # rgb(85, 107, 47)
    throw NotImplementedError
  end

  def darkorange
    # rgb(255, 140, 0)
    throw NotImplementedError
  end

  def darkorchid
    # rgb(153, 50, 204)
    throw NotImplementedError
  end

  def darkred
    # rgb(139, 0, 0)
    throw NotImplementedError
  end

  def darksalmon
    # rgb(233, 150, 122)
    throw NotImplementedError
  end

  def darkseagreen
    # rgb(143, 188, 143)
    throw NotImplementedError
  end

  def darkslateblue
    # rgb(72, 61, 139)
    throw NotImplementedError
  end

  def darkslategray
    # rgb(47, 79, 79)
    throw NotImplementedError
  end

  def darkturquoise
    # rgb(0, 206, 209)
    throw NotImplementedError
  end

  def darkviolet
    # rgb(148, 0, 211)
    throw NotImplementedError
  end

  def deeppink
    # rgb(255, 20, 147)
    throw NotImplementedError
  end

  def deepskyblue
    # rgb(0, 191, 255)
    throw NotImplementedError
  end

  def dimgray
    # rgb(105, 105, 105)
    throw NotImplementedError
  end

  def dodgerblue
    # rgb(30, 144, 255)
    throw NotImplementedError
  end

  def firebrick
    # rgb(178, 34, 34)
    throw NotImplementedError
  end

  def floralwhite
    # rgb(255, 250, 240)
    throw NotImplementedError
  end

  def forestgreen
    # rgb(34, 139, 34)
    throw NotImplementedError
  end

  def fuchsia
    # rgb(255, 0, 255)
    throw NotImplementedError
  end

  def gainsboro
    # rgb(220, 220, 220)
    throw NotImplementedError
  end

  def ghostwhite
    # rgb(248, 248, 255)
    throw NotImplementedError
  end

  def gold
    # rgb(255, 215, 0)
    throw NotImplementedError
  end

  def goldenrod
    # rgb(218, 165, 32)
    throw NotImplementedError
  end

  def gray
    # rgb(128, 128, 128)
    throw NotImplementedError
  end

  def green
    # rgb(0, 128, 0)
    throw NotImplementedError
  end

  def greenyellow
    # rgb(173, 255, 47)
    throw NotImplementedError
  end

  def honeydew
    # rgb(240, 255, 240)
    throw NotImplementedError
  end

  def hotpink
    # rgb(255, 105, 180)
    throw NotImplementedError
  end

  def indianred
    # rgb(205, 92, 92)
    throw NotImplementedError
  end

  def indigo
    # rgb(75, 0, 130)
    throw NotImplementedError
  end

  def ivory
    # rgb(255, 255, 240)
    throw NotImplementedError
  end

  def khaki
    # rgb(240, 230, 140)
    throw NotImplementedError
  end

  def lavender
    # rgb(230, 230, 250)
    throw NotImplementedError
  end

  def lavenderblush
    # rgb(255, 240, 245)
    throw NotImplementedError
  end

  def lawngreen
    # rgb(124, 252, 0)
    throw NotImplementedError
  end

  def lemonchiffon
    # rgb(255, 250, 205)
    throw NotImplementedError
  end

  def lightblue
    # rgb(173, 216, 230)
    throw NotImplementedError
  end

  def lightcoral
    # rgb(240, 128, 128)
    throw NotImplementedError
  end

  def lightcyan
    # rgb(224, 255, 255)
    throw NotImplementedError
  end

  def lightgoldenrodyellow
    # rgb(250, 250, 210)
    throw NotImplementedError
  end

  def lightgreen
    # rgb(144, 238, 144)
    throw NotImplementedError
  end

  def lightgrey
    # rgb(211, 211, 211)
    throw NotImplementedError
  end

  def lightpink
    # rgb(255, 182, 193)
    throw NotImplementedError
  end

  def lightsalmon
    # rgb(255, 160, 122)
    throw NotImplementedError
  end

  def lightseagreen
    # rgb(32, 178, 170)
    throw NotImplementedError
  end

  def lightskyblue
    # rgb(135, 206, 250)
    throw NotImplementedError
  end

  def lightslategray
    # rgb(119, 136, 153)
    throw NotImplementedError
  end

  def lightsteelblue
    # rgb(176, 196, 222)
    throw NotImplementedError
  end

  def lightyellow
    # rgb(255, 255, 224)
    throw NotImplementedError
  end

  def lime
    # rgb(0, 255, 0)
    throw NotImplementedError
  end

  def limegreen
    # rgb(50, 205, 50)
    throw NotImplementedError
  end

  def linen
    # rgb(250, 240, 230)
    throw NotImplementedError
  end

  def magenta
    # rgb(255, 0, 255)
    throw NotImplementedError
  end

  def maroon
    # rgb(128, 0, 0)
    throw NotImplementedError
  end

  def mediumaquamarine
    # rgb(102, 205, 170)
    throw NotImplementedError
  end

  def mediumblue
    # rgb(0, 0, 205)
    throw NotImplementedError
  end

  def mediumorchid
    # rgb(186, 85, 211)
    throw NotImplementedError
  end

  def mediumpurple
    # rgb(147, 112, 219)
    throw NotImplementedError
  end

  def mediumseagreen
    # rgb(60, 179, 113)
    throw NotImplementedError
  end

  def mediumslateblue
    # rgb(123, 104, 238)
    throw NotImplementedError
  end

  def mediumspringgreen
    # rgb(0, 250, 154)
    throw NotImplementedError
  end

  def mediumturquoise
    # rgb(72, 209, 204)
    throw NotImplementedError
  end

  def mediumvioletred
    # rgb(199, 21, 133)
    throw NotImplementedError
  end

  def midnightblue
    # rgb(25, 25, 112)
    throw NotImplementedError
  end

  def mintcream
    # rgb(245, 255, 250)
    throw NotImplementedError
  end

  def mistyrose
    # rgb(255, 228, 225)
    throw NotImplementedError
  end

  def moccasin
    # rgb(255, 228, 181)
    throw NotImplementedError
  end

  def navajowhite
    # rgb(255, 222, 173)
    throw NotImplementedError
  end

  def navy
    # rgb(0, 0, 128)
    throw NotImplementedError
  end

  def oldlace
    # rgb(253, 245, 230)
    throw NotImplementedError
  end

  def olive
    # rgb(128, 128, 0)
    throw NotImplementedError
  end

  def olivedrab
    # rgb(107, 142, 35)
    throw NotImplementedError
  end

  def orange
    # rgb(255, 165, 0)
    throw NotImplementedError
  end

  def orangered
    # rgb(255, 69, 0)
    throw NotImplementedError
  end

  def orchid
    # rgb(218, 112, 214)
    throw NotImplementedError
  end

  def palegoldenrod
    # rgb(238, 232, 170)
    throw NotImplementedError
  end

  def palegreen
    # rgb(152, 251, 152)
    throw NotImplementedError
  end

  def paleturquoise
    # rgb(175, 238, 238)
    throw NotImplementedError
  end

  def palevioletred
    # rgb(219, 112, 147)
    throw NotImplementedError
  end

  def papayawhip
    # rgb(255, 239, 213)
    throw NotImplementedError
  end

  def peachpuff
    # rgb(255, 218, 185)
    throw NotImplementedError
  end

  def peru
    # rgb(205, 133, 63)
    throw NotImplementedError
  end

  def pink
    # rgb(255, 192, 203)
    throw NotImplementedError
  end

  def plum
    # rgb(221, 160, 221)
    throw NotImplementedError
  end

  def powderblue
    # rgb(176, 224, 230)
    throw NotImplementedError
  end

  def purple
    # rgb(128, 0, 128)
    throw NotImplementedError
  end

  def red
    # rgb(255, 0, 0)
    throw NotImplementedError
  end

  def rosybrown
    # rgb(188, 143, 143)
    throw NotImplementedError
  end

  def royalblue
    # rgb(65, 105, 225)
    throw NotImplementedError
  end

  def saddlebrown
    # rgb(139, 69, 19)
    throw NotImplementedError
  end

  def salmon
    # rgb(250, 128, 114)
    throw NotImplementedError
  end

  def sandybrown
    # rgb(244, 164, 96)
    throw NotImplementedError
  end

  def seagreen
    # rgb(46, 139, 87)
    throw NotImplementedError
  end

  def seashell
    # rgb(255, 245, 238)
    throw NotImplementedError
  end

  def sienna
    # rgb(160, 82, 45)
    throw NotImplementedError
  end

  def silver
    # rgb(192, 192, 192)
    throw NotImplementedError
  end

  def skyblue
    # rgb(135, 206, 235)
    throw NotImplementedError
  end

  def slateblue
    # rgb(106, 90, 205)
    throw NotImplementedError
  end

  def slategray
    # rgb(112, 128, 144)
    throw NotImplementedError
  end

  def snow
    # rgb(255, 250, 250)
    throw NotImplementedError
  end

  def springgreen
    # rgb(0, 255, 127)
    throw NotImplementedError
  end

  def steelblue
    # rgb(70, 130, 180)
    throw NotImplementedError
  end

  def tan
    # rgb(210, 180, 140)
    throw NotImplementedError
  end

  def teal
    # rgb(0, 128, 128)
    throw NotImplementedError
  end

  def thistle
    # rgb(216, 191, 216)
    throw NotImplementedError
  end

  def tomato
    # rgb(255, 99, 71)
    throw NotImplementedError
  end

  def turquoise
    # rgb(64, 224, 208)
    throw NotImplementedError
  end

  def violet
    # rgb(238, 130, 238)
    throw NotImplementedError
  end

  def wheat
    # rgb(245, 222, 179)
    throw NotImplementedError
  end

  def white
    # rgb(255, 255, 255)
    throw NotImplementedError
  end

  def whitesmoke
    # rgb(245, 245, 245)
    throw NotImplementedError
  end

  def yellow
    # rgb(255, 255, 0)
    throw NotImplementedError
  end

  def yellowgreen
    # rgb(154, 205, 50)
    throw NotImplementedError
  end
end
