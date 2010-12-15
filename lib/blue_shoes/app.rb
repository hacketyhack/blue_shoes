require_relative 'gui/qt'

module Shoes
  #this class represents a whole Shoes App.
  class App < Gui::Application #:nodoc: all

    def initialize opts = {}, blk #:nodoc:

      super ARGV

      #set the application icon to the shoes logo
      set_window_icon(Gui::Icon.new "#{File.expand_path(File.dirname(__FILE__))}/../../static/blue_shoes.jpg")

      #set up some options with defaults
      height = opts[:height] || 200
      width = opts[:width] || 400
      resizeable = opts[:resizable].nil? ? true : false

      @_main_window = Gui::Widget.new do

        self.layout = Shoes::Stack.new
        resize height, width

        #this is the list of subwidgets we've got
        @widgets = []

        #we can make the window unresizable by adding a minimum and maximum
        #size
        unless resizeable
          setMaximumSize(height,width)
          setMinimumSize(height,width)
        end


        # in QT, each widget has a paint_event that gets called whenever
        # it needs to be repainted. 
        def self.paintEvent event
          #we create a painter...
          painter = Gui::Painter.new self
          #then call it over every widget in our list
          @widgets.each{|w| w.draw painter }
          #and then end painting
          painter.end
        end

        #a nice convenience function to add our widgets to the array
        def add_widget widget
          @widgets << widget
        end

      end

      #we want to have a current widget, which starts off as the main window
      @_current_widget = @_main_window

      #we evaluate the block we were passed. This is pretty much the heart of
      #Shoes.
      instance_eval &blk

      #then we show our window
      @_main_window.show
      #and call QT's exec to kick things off!
      exec
      exit
    end

    #Create a new button.
    def button txt, style={}, &blk

      #create the button, don't forget to hook up that signal!
      b = Gui::PushButton.new txt do
        connect(SIGNAL :clicked) { blk.call } if blk
      end

      #add it to our widget list
      add_widget b

      #and we want to return it.
      b
    end

    #a convenience function for adding a widget to the current widget
    def add_widget widget
      @_current_widget.layout.add_widget widget, 0
    end

    def add_style style
      @_current_widget.layout.add_style style
    end

    #these classes should probably be moved to Shoes::Dialog

    #create an alert
    class Alert < Gui::Dialog
      def initialize(message, parent = nil)
        super(parent)
        Gui::MessageBox::information(self,"Alert!" , message)
      end
    end
    
    # Pops up a window containing a short message.
    def alert(message)
      Alert.new message
    end

    class Ask < Gui::Dialog
      attr_accessor :text

      def initialize(message, parent = nil)
        super(parent)
        ok = Gui::Boolean.new
        self.text = Gui::InputDialog.getText(self,
                                        "I have a Question?",
                                        message,
                                        Gui::LineEdit::Normal,
                                        Gui::Dir::home().dirName(),
                                        ok)
      end
    end

    # Pops up a window and asks a question.
    def ask(message)
      ask = Ask.new message
      ask.text
    end


    # Pops up a color picker window. The program will wait for a color to be picked, then gives you back a Color object. See the Color help for some ways you can use this color.
    def ask_color(title)
      # returns Shoes::Color
      throw NotImplementedError
    end

    # Pops up an "Open file..." window. It's the standard window which shows all of your folders and lets you select a file to open. Hands you back the name of the file.
    def ask_open_file
      # returns a string
      throw NotImplementedError
    end

    # Pops up a "Save file..." window, similiar to ask_open_file, described previously.
    def ask_save_file
      # returns a string
      throw NotImplementedError
    end

    # Pops up an "Open folder..." window. It's the standard window which shows all of your folders and lets you select a folder to open. Hands you back the name of the folder.
    def ask_open_folder
      # returns a string
      throw NotImplementedError
    end

    # Pops up a "Save folder..." window, similiar to ask_open_folder, described previously. On OS X, this method currently behaves like an alias of ask_open_folder.
    def ask_save_folder
      # returns a string
      throw NotImplementedError
    end

    # Pops up a yes-or-no question. If the person at the computer, clicks yes, you'll get back a true. If not, you'll get back false.
    def confirm(question)
      # returns true or false
      throw NotImplementedError
    end

    # Sends a debug message to the Shoes console. You can bring up the Shoes console by pressing Alt-/ on any Shoes window (or ⌘-/ on OS X.)
    def debug(message)
      # returns a string
      throw NotImplementedError
    end

    # Sends an error message to the Shoes console. This method should only be used to log errors. Try the debug method for logging messages to yourself.
    def error(message)
      # returns nil
      throw NotImplementedError
    end

    # Loads a TrueType (or other type of font) from a file. While TrueType is supported by all platforms, your platform may support other types of fonts. Shoes uses each operating system's built-in font system to make this work.
    def font(message)
      # returns an array of font family names
      throw NotImplementedError
    end

    # Builds a linear gradient from two colors. For each color, you may pass in a Shoes::Color object or a string describing the color.
    def gradient(color1, color2)
      # returns Shoes::Pattern
      Shoes::Pattern.new([color1, color2])
    end

    # Create a grayscale color from a level of darkness and, optionally, an alpha level.
    def gray(darkness, alpha)
      # returns  Shoes::Color
      throw NotImplementedError
    end

    # Logs an informational message to the user in the Shoes console. So, where debug messages are designed to help the program figure out what's happening, info messages tell the user extra information about the program.
    def info(message)
      # returns nil
      throw NotImplementedError
    end

    # Create a color from red, green and blue components. An alpha level (indicating transparency) can also be added, optionally.
    # This method may also be called as Shoes.rgb.
    def rgb(red, green, blue, alpha = 255)
      # returns Shoes::Color
      Shoes::Color.new(red, green, blue, alpha)
    end


    # Logs a warning for the user. A warning is not a catastrophic error (see error for that.) It is just a notice that the program will be changing in the future or that certain parts of the program aren't reliable yet.
    def warn(message)
      # returns nil
      throw NotImplementedError
    end

    
    # the system clipboard
    attr_accessor :clipboard

    # Closes the app window
    def close
      throw NotImplementedError
    end

    #starts a download thread
    def download url, opts={}, &blk
      throw NotImplementedError
    end

    # Gets a string containing the URL of the current app.
    def location
      throw NotImplementedError
    end

    # Identifies the mouse cursor's location, along with which button is being pressed.
    def mouse
      # an array of numbers: button, left, top
      throw NotImplementedErrror
    end

    # Gets the app which launched this app. In most cases, this will be nil. But if this app was launched using the window method, the owner will be the app which called window.
    def owner
      #returns Shoes::App
      throw NotImplementedError
    end

    # Has the window been fully constructed and displayed? This is useful for threaded code which may try to use the window before it is completely built. (Also see the start event which fires once the window is open.)
    def started?
      # returns true or false
      throw NotImplementedError
    end


    # Changes the location, in order to view a different Shoes URL.
    def visit url
      throw NotImplementedError
    end

    # Draws an arc shape (a section of an oval) at coordinates (left, top). This method just give you a bit more control than oval, by offering the :angle1 and :angle2 styles. (In fact, you can mimick the oval method by setting :angle1 to 0 and :angle2 to Shoes::TWO_PI.)
    def arc(left, top, width, height, angle1, angle2)
      # returns Shoes::Shape
      throw NotImplementedError
    end

    # Draws an arrow at coordinates (left, top) with a pixel width.
    def arrow(left, top, width)
      # returns Shoes::Shape
      throw NotImplementedError
    end

    # Sets the line cap, which is the shape at the end of every line you draw. If set to :curve, the end is rounded. The default is :rect, a line which ends abruptly flat. The :project cap is also fat, but sticks out a bit longer.
    def cap(how)
      # returns self
      throw NotImplementedError
    end

    # Sets the fill bucket to a specific color (or pattern.) Patterns can be colors, gradients or images. So, once the fill bucket is set, you can draw shapes and they will be colored in with the pattern you've chosen.
    def fill(pattern)
     # returns pattern
      throw NotimplementedError
    end

    # Blanks the fill color, so that any shapes drawn will not be filled in. Instead, shapes will have only a lining, leaving the middle transparent.
    def nofill
      # returns self
      throw NotImplementedError
    end

    # Empties the line color. Shapes drawn will have no outer line. If nofill is also set, shapes drawn will not be visible.
    def nostroke
      # returns  self
      throw NotImplementedError
    end

    # Draws a line using the current line color (aka "stroke") starting at coordinates (left, top) and ending at coordinates (x2, y2).
    def line(left, top, x2, y2)
      # returns  Shoes::Shape
      throw NotImplementedError
    end

    # Draws a circular form at pixel coordinates (left, top) with a width and height of radius pixels. The line and fill colors are used to draw the shape. By default, the coordinates are for the oval's leftmost, top corner, but this can be changed by calling the transform method or by using the :center style on the next method below.
    def oval(left, top, radius)
      # returns  Shoes::Shape
      throw NotImplementedError
    end

    # Draw circular form using a style hash.
    def oval(styles)
      # returns  Shoes::Shape
      throw NotImplementedError
    end

    # Draws a rectangle starting from coordinates (top, left) with dimensions of width x height. Optionally, you may give the rectangle rounded corners with a fifth argument: the radius of the corners in pixels.
    def rect(top, left, width, height, corners = 0)
      # returns  Shoes::Shape
      throw NotImplementedError
    end

    # Draw a rectangle using a style hash.
    def rect(styles)
      # returns  Shoes::Shape
      throw NotImplementedError
    end

    # Rotates the pen used for drawing by a certain number of degrees, so that any shapes will be drawn at that angle.
    def rotate(degrees)
      # returns  self
      throw NotImplementedError
    end

    # Describes an arbitrary shape to draw, beginning at coordinates (left, top) and continued by calls to line_to, move_to, curve_to and arc_to inside the block. You can look at it as sketching a shape with a long line that curves and arcs and bends.
    def shape(left, top)
      # returns Shoes::Shape
      throw NotImplementedError
    end

    # Draws a star using the stroke and fill colors. The star is positioned with its center point at coordinates (left, top) with a certain number of points. The outer width defines the full radius of the star; the inner width specifies the radius of the star's middle, where points stem from.
    def star(left, top, points = 10, outer = 100.0, inner = 50.0)
      # returns  Shoes::Shape
      throw NotImplementedError
    end

    # Set the active line color for this slot. The pattern may be a color, a gradient or an image, all of which are categorized as "patterns." The line color is then used to draw the borders of any subsequent shape.
    def stroke(pattern)
      # returns  pattern
      stroke = Shoes::Stroke.new(pattern)
      add_style stroke.to_style
      stroke
    end

    # Sets the line size for all drawing within this slot. Whereas the stroke method alters the line color, the strokewidth method alters the line size in pixels. Calling strokewidth(4) will cause lines to be drawn 4 pixels wide.
    def strokewidth(number)
      # returns  self
      throw NotImplementedError
    end

    # Should transformations (such as skew and rotate) be performed around the center of the shape? Or the corner of the shape? Shoes defaults to :corner.
    def transform(where)
      # returns  self
      throw NotImplementedError
    end

    # Moves the starting point of the drawing pen for this slot. Normally, the pen starts at (0, 0) in the top-left corner, so that all shapes are drawn from that point. With translate, if the starting point is moved to (10, 20) and a shape is drawn at (50, 60), then the shape is actually drawn at (60, 80) on the slot.
    def translate(left, top)
      # returns  self
      throw NotImplementedError
    end

    # Starts an animation timer, which runs parallel to the rest of the app. The fps is a number, the frames per seconds. This number dictates how many times per second the attached block will be called.
    def animate(fps)
      # returns  |frame| ... } » Shoes::Animation
      throw NotImplementedError
    end


    

    # Draws a Background element with a specific color (or pattern.) Patterns can be colors, gradients or images. Colors and images will tile across the background. Gradients stretch to fill the background.
    def background(pattern, style = {}, &blk)
      background = Shoes::Background.new(pattern, style)
      @_main_window.add_widget background
      background
    end

    # Creates a Banner text block. Shoes automatically styles this text to 48 pixels high.
    def banner(text)
      # returns  Shoes::Banner
      throw NotImplementedError
    end

    # Draws a Border element using a specific color (or pattern.) Patterns can be colors, gradients or images. Colors and images will tile across the border. Gradients stretch to fill the border.
    def border(text, opts={})
      # returns  Shoes::Border
      throw NotImplementedError
    end

    # Creates a Caption text block. Shoes styles this text to 14 pixels high.
    def caption(text)
      # returns  Shoes::Caption
      throw NotImplementedError
    end

    # Adds a check box.
    def check()
      # returns  Shoes::Check
      throw NotImplementedError
    end

    # Create a Code text fragment. This text defaults to a monospaced font.
    def code(text)
      # returns  Shoes::Code
      throw NotImplementedError
    end

    # Creates a Del text fragment (short for "deleted") which defaults to text with a single strikethrough in its middle.
    def del(text)
      # returns  Shoes::Del
      throw NotImplementedError
    end

    # Opens a new app window (just like the window method does,) but the window is given a dialog box look.
    def dialog(styles)
      # returns  ... } » Shoes::App
      throw NotImplementedError
    end

    # Adds a large, multi-line textarea to this slot. The text is optional and should be a string that will start out the box. An optional block can be attached here which is called any type the user changes the text in the box.
    def edit_box(text)
      # returns  Shoes::EditBox
      throw NotImplementedError
    end

    # Adds a single-line text box to this slot. The text is optional and should be a string that will start out the box. An optional block can be attached here which is called any type the user changes the text in the box.
    def edit_line(text)
      # returns  Shoes::EditLine
      throw NotImplementedError
    end

    # Creates an Em text fragment (short for "emphasized") which, by default, is styled with italics.
    def em(text)
      # returns  Shoes::Em
      throw NotImplementedError
    end

    # A timer similar to the animation method, but much slower. This timer fires a given number of seconds, running the block attached. So, for example, if you need to check a web site every five minutes, you'd call every(300) with a block containing the code to actually ping the web site.
    def every(seconds)
      # returns Shoes::Every
      throw NotImplementedError
    end

    # A flow is an invisible box (or "slot") in which you place Shoes elements. Both flows and stacks are explained in great detail on the main Slots page.
    def flow(style, &blk)
      flow = Shoes::Flow.new(style)
      add_widget flow
      instance_eval &blk
      flow
    end

    # Creates an Image element for displaying a picture. PNG, JPEG and GIF formats are allowed.
    def image(path)
      # returns  Shoes::Image
      throw NotImplementedError
    end

    # Quickly grab the width and height of an image. The image won't be loaded into the cache or displayed.
    def imagesize(path)
      # returns  [width, height]
      throw NotImplementedError
    end

    # Creates an Ins text fragment (short for "inserted") which Shoes styles with a single underline.
    def ins(text)
      # returns  Shoes::Ins
      throw NotImplementedError
    end

    # Creates an Inscription text block. Shoes styles this text at 10 pixels high.
    def inscription(text)
      # returns  Shoes::Inscription
      throw NotImplementedError
    end

    # Creates a Link text block, which Shoes styles with a single underline and colors with a #06E (blue) colored stroke.
    def link(text, opts)
      # returns  Shoes::Link
      throw NotImplementedError
    end

    # Adds a drop-down list box containing entries for everything in the items array. An optional block may be attached, which is called if anything in the box becomes selected by the user.
    def list_box(opts)
      # returns  Shoes::ListBox
      throw NotImplementedError
    end

    # Adds a progress bar.
    def progress
      # returns  Shoes::Progress
      throw NotImplementedError
    end

    # Create a Para text block (short for "paragraph") which Shoes styles at 12 pixels high.
    def para(text)
      para = Shoes::Para.new(text)
      add_widget para.to_label
      para
    end

    # Adds a radio button. If a group name is given, the radio button is considered part of a group. Among radio buttons in the same group, only one may be checked. (If no group name is given, the radio button is grouped with any other radio buttons in the same slot.)
    def radio(group)
      # returns  Shoes::Radio
      throw NotImplementedError
    end

    # Creates a Span text fragment, unstyled by default.
    def span(text)
      # returns  Shoes::Span
      throw NotImplementedError
    end

    # Creates a new stack. A stack is a type of slot. (See the main Slots page for a full explanation of both stacks and flows.)
    def stack(style, &blk)
      stack = Shoes::Stack.new
      add_widget stack
      instance_eval &blk
      stack
    end

    # Creates a Strong text fragment, styled in bold by default.
    def strong(text)
      strong = Shoes::Strong.new(text)
      strong
    end

    # Creates a Sub text fragment (short for "subscript") which defaults to lowering the text by 10 pixels and styling it in an x-small font.
    def sub(text)
      # returns  Shoes::Sub
      throw NotImplementedError
    end

    # Creates a Subtitle text block. Shoes styles this text to 26 pixels high.
    def subtitle(text)
      # returns  Shoes::Subtitle
      throw NotImplementedError
    end

    # Creates a Sup text fragment (short for "superscript") which defaults to raising the text by 10 pixels and styling it in an x-small font.
    def sup(text)
      # returns  Shoes::Sup
      throw NotImplementedError
    end

    # Creates a Tagline text block. Shoes styles this text to 18 pixels high.
    def tagline(text)
      # returns  Shoes::Tagline
      throw NotImplementedError
    end

    # A one-shot timer. If you want to schedule to run some code in a few seconds (or minutes, hours) you can attach the code as a block here.
    def timer(seconds)
      # returns Shoes::Timer
      throw NotImplementedError
    end

    # Creates a Title text block. Shoes styles these elements to 34 pixels high.
    def title(text)
      # returns  Shoes::Title
      throw NotImplementedError
    end

    # Embeds a movie in this slot.
    def video(url)
      # returns  Shoes::Video
      throw NotImplementedError
    end

    # Opens a new app window. This method is almost identical to the Shoes.app method used to start an app in the first place. The difference is that the window method sets the new window's owner property. (A normal Shoes.app has its owner set to nil.)
    def window(styles)
      # returns Shoes::App
      throw NotImplementedError
    end

    # The click block is called when a mouse button is clicked. The button is the number of the mouse button which has been pressed. The left and top are the mouse coordinates at which the click happened.
    def click(&blk)
      # returns self
      throw NotImplementedError
    end

    # When a slot is removed, it's finish event occurs. The finish block is immediately handed self, the slot object which has been removed.
    def finish(&blk)
      # returns self
      throw NotImplementedError
    end

    # The hover event happens when the mouse enters the slot. The block gets self, meaning the object which was hovered over.
    def hover(&blk)
      # returns self
      throw NotImplementedError
    end

    # Whenever a key (or combination of keys) is pressed, the block gets called. The block is sent a key which is a string representing the character (such as the letter or number) on the key. For special keys and key combos, a Ruby symbol is sent, rather than a string.
    def keypress(&blk)
      # returns self
      throw NotImplementedError
    end

    # The leave event takes place when the mouse cursor exits a slot. The moment it no longer is inside the slot's edges. When that takes place, the block is called with self, the slot object which is being left.
    def leave(&blk)
      # returns self
      throw NotImplementedError
    end

    # The motion block gets called every time the mouse moves around inside the slot. The block is handed the cursor's left and top coordinates.
    def motion(&blk)
      # returns self
      throw NotImplementedError
    end

    # The release block runs whenever the mouse is unclicked (on mouse up). When the finger is lifted. The button is the number of the button that was depressed. The left and top are the coordinates of the mouse at the time the button was released.
    def release(&blk)
      # returns self
      throw NotImplementedError
    end

    # The first time the slot is drawn, the start event fires. The block is handed self, the slot object which has just been drawn.
    def start(&blk)
      # returns self
      throw NotImplementedError
    end

    # Adds elements to the end of a slot.
    def append(&blk)
      # returns self
      throw NotImplementedError
    end

    # Adds elements to a specific place in a slot, just after the element which is a child of the slot.
    def after(&blk)
      # returns self
      throw NotImplementedError
    end

    # Adds elements to a specific place in a slot, just before the element which is a child of the slot.
    def before(&blk)
      # returns self
      throw NotImplementedError
    end

    # Empties the slot of any elements, timers and nested slots. This is effectively identical to looping through the contents of the slot and calling each element's remove method.
    def clear(&blk)
      # returns self
      throw NotImplementedError
    end

    # The clear method also takes an optional block. The block will be used to replace the contents of the slot.
    def clear(&blk)
      # returns self
      throw NotImplementedError
    end

    # Adds elements to the beginning of a slot.
    def prepend(&blk)
      # returns self
      throw NotImplementedError
    end

    # A shortcut method for setting the :displace_left and :displace_top styles. Displacing is a handy way of moving a slot without altering the layout. In fact, the top and left methods will not report displacement at all. So, generally, displacement is only for temporary animations. For example, jiggling a button in place.
    def displace(left, top)
      # returns self
      throw NotImplementedError
    end

    # The size of the scrollbar area. When Shoes needs to show a scrollbar, the scrollbar may end up covering up some elements that touch the edge of the window. The gutter tells you how many pixels to expect the scrollbar to cover.
    def gutter
      # returns a number
      throw NotImplementedError
    end

    # The vertical size of the viewable slot in pixels. So, if this is a scrolling slot, you'll need to use scroll_height() to get the full size of the slot.
    def height
      # returns a number
      throw NotImplementedError
    end

    # Hides the slot, so that it can't be seen. See also show and toggle.
    def hide
      #returns self
      throw NotImplementedError
    end

    # The left pixel location of the slot. Also known as the x-axis coordinate.
    def left
      # returns a number
      throw NotImplementedError
    end

    # Moves the slot to specific coordinates, the (left, top) being the upper left hand corner of the slot.
    def move(left, top)
      # returns self
      throw NotImplementedError
    end

    # Removes the slot. It will no longer be displayed and will not be listed in its parent's contents. It's gone.
    def remove
      # returns self
      throw NotImplementedError
    end

    # Is this slot allowed to show a scrollbar? True or false. The scrollbar will only appear if the height of the slot is also fixed.
    def scroll
      # returns true or false
      throw NotImplementedError
    end

    # The vertical size of the full slot, including any of it which is hidden by scrolling.
    def scroll_height
      # returns a number
      throw NotImplementedError
    end

    # The top coordinate which this slot can be scrolled down to. The top coordinate of a scroll bar is always zero. The bottom coordinate is the full height of the slot minus one page of scrolling. This bottom coordinate is what scroll_max returns.
    def scroll_max
      # returns a number
      throw NotImplementedError
    end

    # The top coordinate which this slot is scrolled down to. So, if the slot is scrolled down twenty pixels, this method will return 20.
    def scroll_top
      # returns a number
      throw NotImplementedError
    end

    # Scrolls the slot to a certain coordinate. This must be between zero and scroll_max.
    def scroll_top=(number)
      throw NotImplementedErrror
    end

    # Reveals the slot, if it is hidden. See also hide and toggle.
    def show
      # returns self
      throw NotImplementedError
    end

    # Calling the style method with no arguments returns a hash of the styles presently applied to this slot.
    def style
      # returns styles
      throw NotImplementedError
    end

    # Alter the slot using a hash of style settings. Any of the methods on this page (aside from this method, of course) can be used as a style setting. So, for example, there is a width method, thus there is also a width style.
    def style(styles)
      # returns styles
      throw NotImplementedError
    end

    # Hides the slot, if it is shown. Or shows the slot, if it is hidden.
    def toggle
      # returns self
      throw NotImplementedError
    end

    # The top pixel location of the slot. Also known as the y-axis coordinate.
    def top
      # returns a number
      throw NotImplementedError
    end

    # The horizontal size of the slot in pixels.
    def width
      # returns a number
      throw NotImplementedError
    end

    # Lists all elements in a slot.
    def contents
      # returns an array of elements
      throw NotImplementedError
    end

    # Gets the object for this element's container.
    def parent
      # returns a Shoes::Stack or Shoes::Flow
      throw NotImplementedError
    end

  end
end

