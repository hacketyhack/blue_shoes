# Constants copied from Qt::BrushStyle
# at http://doc.trolltech.com/4.6/qt.html#BrushStyle-enum
module Gui
  class PenStyles
    NoPen          = Qt::NoPen          # 0 no line at all. For example, QPainter::drawRect() fills but does not draw any boundary line.
    SolidLine      = Qt::SolidLine      # 1 A plain line.
    DashLine       = Qt::DashLine       # 2 Dashes separated by a few pixels.
    DotLine        = Qt::DotLine        # 3 Dots separated by a few pixels.
    DashDotLine    = Qt::DashDotLine    # 4 Alternate dots and dashes.
    DashDotDotLine = Qt::DashDotDotLine # 5 One dash, two dots, one dash, two dots.
    CustomDashLine = Qt::CustomDashLine # 6 A custom pattern defined using QPainterPathStroker::setDashPattern().
  end
end
