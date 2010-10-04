require 'forwardable'
module Shoes
  class Stack < Qt::VBoxLayout
    extend Forwardable
    # TODO most are still missing
    def_delegators :@layout, :add_widget#, :add_layout, :add_item, :remove_item,
      #:remove_widget, :remove_layout, :count
    def initialize
      super
      @layout = Qt::VBoxLayout.new
      add_layout(@layout, 0)
      add_stretch(1)
    end

    def draw painter
    end

  end
end
