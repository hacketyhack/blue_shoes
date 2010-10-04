# Blue Shoes

This is a fork of [Shoes](http://shoes.heroku.com/), written using QT.

# Installing

I'm using Ruby 1.9.2 with qtbindings.

I'm using rvm, so to get 1.9.2, just `rvm install 1.9.2`, and wait!

## dependancies 

To get qtbindings, first you need qt4 for your platform. Instructions shamelessly stolen from [here](http://github.com/ryanmelt/qtbindings):

Debian Linux
------------
1. The following should get you the packages you need:
sudo aptitude install build-essential bison openssl libreadline5
  libreadline-dev curl git-core zlib1g zlib1g-dev libssl-dev vim
  libsqlite3-0 libsqlite3-dev sqlite3 libreadline5-dev libreadline6-dev
  libxml2-dev git-core subversion autoconf xorg-dev libgl1-mesa-dev
  libglu1-mesa-dev

Mac OSX Snow Leopard
-----------------------
1. XCode
2. qt4-mac installed from macports - NOTE: For some reason smokegen does
   not work with the SDK or Cocoa libraries directly from qt.nokia.com -
   Uninstall these if necessary using:
   sudo python /Developer/Tools/uninstall_qt.py

Windows - Note: Only necessary for debugging (binary gem available)
--------
1. mingw from the Qt SDK in your path: ie C:\Qt\2010.04\mingw\bin

## Install the gem

Then you just `gem install qtbindings`, and off you go!

## Use Bundler

Bundler is gaining a lot of steam as a dependancy management tool. So we're using it. To build your bundle, just type

    $ bunlde install

and everything should get built.

# What works

Right now, this simple app works:

    Shoes.app do
      button "Push Me!" do
        name = ask("What is your name?")
        alert("Hello, #{name}")
      end
    end

I'm currently working on getting the calculator example up and running.

# Stubs

All methods and classes should be stubbed out. I went through the manual, and I think I got everything. Some classes have nothing in them, though, so I'm sure I'm missing some things! This was done in like 10 hours, with 6 of them being sleep...

More to come soon!

# Original README
                      
    ((( |||_| ///\ [[[_ (((
     ))) || |  \\/  [[_  )))
    an artsy any-platform app kit <http://github.com/shoes/shoes>

//////////////////////////////////////////////////////////////////////////

    Hi, guys, thankyou for taking Shoes.

    Shoes is for writing plain old windowing software.  But it borrows a
    few things I like from the web:

    * Hyperlinks and URLs within Shoes and to the web.
    * Simple text layout -- though Shoes eschews floats.
    * Images and colors in the layout and in the background.
    * Margin and padding.
    * Resizable layouts.

    However, layouts can be tough on the web.  Like a two-column layout.
    So rather than using floating divs, Shoes uses two layout types:
    stacks and flows.  More on that later.

    Shoes does keep a few things from traditional windowing toolkits:

    * Buttons.
    * Text edit (single-line and multi-line).
    * Progress bars.
    * Scroll bars.
    * Dialogs.

    And, last of all, Shoes gets some inspiration from NodeBox and
    Processing:

    * The whole window is a canvas.
    * Shapes, paths, curves and transformations.
    * Animation.
    * Easy event-handling for mouse and keyboard.

    Lastly, Shoes uses Ruby as its interface language.

    That's really about all that's in Shoes.  It's supposed to be light.
    Not much code and not too much ambition.

//////////////////////////////////////////////////////////////////////////

    WHY NOT WXWINDOWS?  WHY NOT THE FOX TOOLKIT?  OR QT??

    Shoes is strictly inspired by stuff like REBOL/View, HyperCard,
    the web itself and, of course, Processing and NodeBox.

    I don't like the bulkiness and the layers and layers of wxWindows,
    FOX, QT, GNOME.  They are big, big libraries and all the apps look
    identical, devoid of spirit.

    The unique thing about the web is that it gives you very few
    controls, but people are able to build wildly different pages
    with it that are still immediately accessible to people.

//////////////////////////////////////////////////////////////////////////

    THE INSIDE OF SHOES

    So, to save a bit of work, Shoes relies on a few libraries:
 
    * Cairo, for drawing. (http://cairographics.org)
    * Pango, for text.
    * Ruby, for programming.

    All native widgets use the OS APIs directly.  Half of Shoes is platform
    specific code.  The targets are: OSX, Windows and GTK.

//////////////////////////////////////////////////////////////////////////

    STAYING CURRENT WITH SHOES

    Shoes development happens at Github.  You can download a current
    tarball of the very latest Shoes from here:

      http://github.com/shoes/shoes

    Or, if you have git installed, you can clone the repo like so:

      git clone git://github.com/shoes/shoes.git

    Once you have your compiler and dependencies set up, building Shoes
    is as simple as:

      rake

    Your Shoes build will then appear in the `dist` directory.

    For instructions on how to set up your compiler and acquire deps for
    Windows, OS X, and Linux, see the Shoes wiki:
    <http://wiki.github.com/shoes/shoes/BuildingShoes>

//////////////////////////////////////////////////////////////////////////

    LICENSE

    Copyright (c) 2008 why the lucky stiff
    
    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to
    deal in the Software without restriction, including without limitation the
    rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
    sell copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:
      
    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.
       
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
    THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER 
    IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
    CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

