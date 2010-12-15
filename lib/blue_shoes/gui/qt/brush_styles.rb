# Constants copied from Qt::BrushStyle
# at http://doc.trolltech.com/4.6/qt.html#BrushStyle-enum
module Gui
  class BrushStyles
    NoBrush                 = Qt::NoBrush                    # 0       No brush pattern.
    SolidPattern            = Qt::SolidPattern               # 1       Uniform color.
    Dense1Pattern           = Qt::Dense1Pattern              # 2       Extremely dense brush pattern.
    Dense2Pattern           = Qt::Dense2Pattern              # 3       Very dense brush pattern.
    Dense3Pattern           = Qt::Dense3Pattern              # 4       Somewhat dense brush pattern.
    Dense4Pattern           = Qt::Dense4Pattern              # 5       Half dense brush pattern.
    Dense5Pattern           = Qt::Dense5Pattern              # 6       Somewhat sparse brush pattern.
    Dense6Pattern           = Qt::Dense6Pattern              # 7       Very sparse brush pattern.
    Dense7Pattern           = Qt::Dense7Pattern              # 8       Extremely sparse brush pattern.
    HorPattern              = Qt::HorPattern                 # 9       Horizontal lines.
    VerPattern              = Qt::VerPattern                 # 10      Vertical lines.
    CrossPattern            = Qt::CrossPattern               # 11      Crossing horizontal and vertical lines.
    BDiagPattern            = Qt::BDiagPattern               # 12      Backward diagonal lines.
    FDiagPattern            = Qt::FDiagPattern               # 13      Forward diagonal lines.
    DiagCrossPattern        = Qt::DiagCrossPattern           # 14      Crossing diagonal lines.
    LinearGradientPattern   = Qt::LinearGradientPattern      # 15      Linear gradient (set using a dedicated QBrush constructor).
    ConicalGradientPattern  = Qt::ConicalGradientPattern     # 17      Conical gradient (set using a dedicated QBrush constructor).
    RadialGradientPattern   = Qt::RadialGradientPattern      # 16      Radial gradient (set using a dedicated QBrush constructor).
    TexturePattern          = Qt::TexturePattern             # 24      Custom pattern (see QBrush::setTexture()).
    # require 'ruby-debug';  debugger
    # puts "HorPattern Class"

  end
end
