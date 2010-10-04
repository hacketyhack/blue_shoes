module Shoes
  class Video
    # Removes the video from its slot. This will stop the video as well.
    def remove
      #returns self
      throw NotImplementedError
    end

    # Reveals the video, if it has been hidden by the hide() method.
    def show
      # returns self
      throw NotImplementedError
    end

    # Stops the video, if it is playing.
    def stop
      # returns self
      throw NotImplementedError
    end

    # The time position of the video in milliseconds. So, if the video is 10 seconds into play, this method would return the number 10000.
    def time
      # returns a number
      throw NotImplementedError
    end

    # Set the position of the video to a time in milliseconds.
    def time=(number)
      throw NotImplementedError
    end

    # Toggles the visibility of the video. If the video can be seen, then hide is called. Otherwise, show is called.
    def toggle
      # returns self
      throw NotImplementedError
    end
    
  end
end
