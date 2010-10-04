module Shoes
  class Anim < Qt::Widget

    slots 'timer_tripped_slot()'

    def initialize(parent) 
      super(parent)
      @timer = Qt::Timer.new(self) 
      @tripped_times = 0
      connect(@timer, SIGNAL('timeout()'), self, SLOT('timer_tripped_slot()'))
      # Make the timer trip every second (1000 milliseconds)
      @timer.start(1000)
    end

    def timer_tripped_slot()
      puts "ha!"
    end
    

    def stop
      @stop = true
    end

    def continue?
      !@stop
    end

    def pause
      @pause = !@pause
    end

    def pause?
      @pause
    end
  end
end

