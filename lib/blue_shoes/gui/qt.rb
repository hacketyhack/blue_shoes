
####################################
# Next Tasks
# * NoPen and HorPattern are Enums.  Create enum classes PenStyles, BrushStyles
# and embed the values
#
#yay qt4!
require 'Qt4'

#we want to require everything in the blue_shoes directory.
%W[
application
boolean
brush
brush_styles
color
dialog
dir
font
icon
input_dialog
label
line_edit
message_box
painter
pen_styles
push_button
vbox_layout
widget
].each do |f|
  require_relative "qt/#{f}"
end

# app.rb:        Qt::MessageBox::information(self,"Alert!" , message)
# pattern.rb:      painter.setRenderHint Qt::Painter::Antialiasing
# pattern.rb:      painter.setPen Qt::NoPen
# pattern.rb:      painter.setBrush Qt::HorPattern
# pattern.rb:      gradient = Qt::LinearGradient.new(0, 0, 0, 100)
# pattern.rb:      bottom = Qt::Color.new(r(first),g(first),b(first))
# pattern.rb:      top = Qt::Color.new(r(last),g(last),b(last))
# pattern.rb:      painter.setBrush(Qt::Brush.new(gradient))
# stack.rb:  class Stack < Qt::VBoxLayout
# stack.rb:      @layout = Qt::VBoxLayout.new
# text_block.rb:      self.label = Qt::Label.new
# text_block.rb:        label.setFont(Qt::Font.new("Purisa", 12, Qt::Font::Bold));
# text_block.rb:        label.setFont(Qt::Font.new("Purisa", 12));

