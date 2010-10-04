module Shoes
  class Image
    # The full pixel height of the image. Normally, you can just use the height method to figure out how many pixels high the image is. But if you've resized the image or styled it to be larger or something, then height will return the scaled size.
    def full_height
      # returns a number
      throw NotImplementedError
    end

    # The full pixel width of the image. See the full_height method for an explanation of why you might use this method rather than width.
    def full_width
      # returns a number
      throw NotImplementedError
    end

    # The URL or file name of the image.
    def path
      # returns a string
      throw NotImplementedError
    end

    # Swaps the image with a different one, loaded from a file or URL.
    def path=(str)
      # returns a string
      throw NotImplementedError
    end
    
  end
end
