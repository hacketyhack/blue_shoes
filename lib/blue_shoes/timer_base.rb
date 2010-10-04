module Shoes
  class TimerBase
    # Both types of timers automatically start themselves, so there's no need to use this normally. But if you stop a timer and would like to start it up again, then by all means: use this!
    def start
      # returns self
      throw NotImplementedError
    end

    # Pauses the animation or timer. In the case of a one-shot timer that's already happened, it's already stopped and this method will have no effect.
    def stop
      # returns self
      throw NotImplementedError
    end

    # If the animation or timer is stopped, it is started. Otherwise, if it is already running, it is stopped.
    def toggle
      # returns self
      throw NotImplementedError
    end
  end

  class Animation < TimerBase
  end

  class Every < TimerBase
  end

  class Timer < TimerBase
    
  end

end
