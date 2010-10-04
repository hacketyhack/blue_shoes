require 'Qt4'

module Shoes

  class App < Qt::Application

    def initialize
      super ARGV
    end

    def para text
      label = Qt::Label.new
      label.set_text text
      label.show
    end
  end

  def self.app opts={}, &blk
    app = App.new
    app.instance_eval &blk
    app.exec
  end


end

