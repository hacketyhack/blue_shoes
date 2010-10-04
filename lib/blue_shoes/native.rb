module Shoes
  class Native

    # Displacing an element moves it. But without changing the layout around it. This is great for subtle animations, especially if you want to reserve a place for an element while it is still animating. Like maybe a quick button shake or a slot sliding into view.
    def displace(left, top)
      #returns self
      throw NotImplementedError
    end

    # The vertical screen size of the element in pixels. In the case of images, this is not the full size of the image. This is the height of the element as it is shown right now.
    def height
      # returns a number
      throw NotImplementedError
    end

    # Hides the element, so that it can't be seen. See also show and toggle.
    def hide
      # returns self
      throw NotImplementedError
    end

    # Gets you the pixel position of the left edge of the element.
    def left
      # returns a number
      throw NotImplementedError
    end

    # Moves the element to a specific pixel position within its slot. The element is still inside the slot. But it will no longer be stacked or flowed in with the other stuff in the slot. The element will float freely, now absolutely positioned instead.
    def move(left, top)
      # returns self
      throw NotImplementedError
    end

    # Gets the object for this element's container. Also see the slot's contents to do the opposite: get a container's elements.
    def parent
      # returns a Shoes::Stack or Shoes::Flow
      throw NotImplementedError
    end

    # Removes the element from its slot. (In other words: throws it in the garbage.) # The element will no longer be displayed.
    def remove
      # returns self
      throw NotImplementedError
    end

    # Reveals the element, if it is hidden. See also hide and toggle.
    def show
      # returns self
      throw NotImplementedError
    end

    # Gives you the full set of styles applied to this element, in the form of a Hash. While methods like width and height and top give you back specific pixel dimensions, using style[:width] or style[:top], you can get the original setting (things like "100%" for width or "10px" for top.)
    def style
      # returns styles
      throw NotImplementedError
    end

    # Changes the style of an element. This could include the :width and :height of an element, the font :size of some text, the :stroke and :fill of a shape. Or any other number of style settings.
    def style(styles)
      # returns styles
      throw NotImplementedError
    end

    # Hides an element if it is shown. Or shows the element, if it is hidden.
    def toggle
      # returns self
      throw NotImplementedError
    end

    # Gets the pixel position of the top edge of the element.
    def top
      # returns a number
      throw NotImplementedError
    end

    # Gets the pixel width for the full size of the element. This method always returns an exact pixel size. In the case of images, this is not the full width of the image, just the size it is shown at. See the height method for more.
    def width
      # returns a number
      throw NotImplementedError
    end
    
  end

  class Button < Native
    # When a button is clicked, its click block is called. The block is handed self. Meaning: the button which was clicked.
    def click(&blk)
      # returns self
      throw NotImplementedError
    end

    # Moves focus to the button. The button will be highlighted and, if the user hits Enter, the button will be clicked.
    def focus
      # returns self
      throw NotImplementedError
    end
    
  end

  class Check < Native
    # Returns whether the box is checked or not. So, true means "yes, the box is checked!"
    def checked?
      throw NotImplementedError
    end

    # Marks or unmarks the check box. Using checked = false, for instance, unchecks the box.
    def checked=(bool)
      throw NotImplementedError
    end

    # When the check is clicked, its click block is called. The block is handed self, which is the check object which was clicked.
    def click(&blk)
      # returns self
      throw NotImplementedError
    end

    # Moves focus to the check. The check will be highlighted and, if the user hits Enter, the check will be toggled between its checked and unchecked states.
    def focus
      # returns self
      throw NotImplementedError
    end
    
  end

  class EditBox < Native
    # Each time a character is added to or removed from the edit box, its change block is called. The block is given self, which is the edit box object which has changed.
    def change(&blk)
      # returns self
      throw NotImplementedError
    end

    # Moves focus to the edit box. The edit box will be highlighted and the user will be able to type into the edit box.
    def focus
      # returns self
      throw NotImplementedError
    end

    # Return a string of characters which have been typed into the box.
    def text
      # returns self
      throw NotImplementedError
    end

    # Fills the edit box with the characters of a string.
    def text=(str)
      throw NotImplementedError
    end
    
  end

  class EditLine < Native
    # Each time a character is added to or removed from the edit line, its change block is called. The block is given self, which is the edit line object which has changed.
    def change(&blk)
      # returns self
      throw NotImplementedError
    end

    # Moves focus to the edit line. The edit line will be highlighted and the user will be able to type into the edit line.
    def focus
      # returns self
      throw NotImplementedError
    end

    # Return a string of characters which have been typed into the line.
    def text
      # returns self
      throw NotImplementedError
    end

    # Fills the edit line with the characters of a string.
    def text=(str)
      throw NotImplementedError
    end
  end

  class ListBox < Native
    # Selects the option in the list box that matches the string given by item.
    def choose(item)
      # returns self
      throw NotImplementedErrror
    end

    # Moves focus to the list box. The list box will be highlighted and, if the user hits the up and down arrow keys, other options in the list will be selected.
    def focus
      # returns self
      throw NotImplementedErrror
    end

    # Returns the complete list of strings that the list box presently shows as its options.
    def items
      # returns an array of strings
      throw NotImplementedErrror
    end

    # Replaces the list box's options with a new list of strings.
    def items=(arr)
      # returns
      throw NotImplementedErrror
    end

    # A string containing whatever text is shown highlighted in the list box right now. If nothing is selected, nil will be the reply.
    def text
      # returns a string
      throw NotImplementedErrror
    end

  end

  class Progress < Native
    # a decimal number from 0.0 to 1.0, indicating how far along the progress bar is.
    attr_accessor :fraction
  end

  class Radio < Native
    # Returns whether the radio button is checked or not. So, true means "yes, it is checked!"
    def checked?
      # returns true or false
      throw NotImplementedErrror
    end

    # Marks or unmarks the radio button. Using checked = false, for instance, clears the radio.
    def checked=(bool)
      throw NotImplementedErrror
    end

    # When the radio button is clicked, its click block is called. The block is handed self, which is an object representing the radio which was clicked.
    def click(&blk)
      # returns self
      throw NotImplementedErrror
    end

    # Moves focus to the radio. The radio will be highlighted and, if the user hits Enter, the radio will be toggled between its marked and unmarked states.
    def focus
      # returns self
      throw NotImplementedErrror
    end
    
  end

  class Slider < Native
  end
  
end
