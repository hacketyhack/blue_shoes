require 'forwardable'
module Shoes
  class Stack < Qt::VBoxLayout
    extend Forwardable
    # TODO most are still missing
    #def_delegators :@layout, :add_widget#, :add_layout, :add_item, :remove_item,
      #:remove_widget, :remove_layout, :count
   
    attr_reader :widgets
    #instead of immediately delegating keep our own array as well, and add stylesheets
    def add_widget(widget, stretch)
      @widgets << widget
      puts stylesheet.inspect
      widget.setStyleSheet(stylesheet)
      @layout.add_widget(widget, stretch)
    end

    def stylesheet
      @styles.join(';') + ';'
    end

    def add_style(style)
      @styles << style
    end

    def initialize
      super
      @layout = Qt::VBoxLayout.new
      @widgets = []
      @styles = []
      add_layout(@layout, 0)
      add_stretch(1)
    end

    def draw painter
    end

  end
end
