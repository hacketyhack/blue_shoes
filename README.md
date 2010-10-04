    ((( |||_| ///\ [[[_ (((
     ))) || |  \\/  [[_  )))
    an artsy any-platform app kit <http://github.com/shoes/shoes>

# About Shoes

Shoes is the best little DSL for cross-platform GUI programming there is. It feels like real Ruby, rather than just another C++ library wrapper. If Gtk or wxWidgets is Rails, Shoes is Sinatra.

# Let me tell you a story about Shoes

  Way way back in the day, there was a guy named \_why. He created a project known as [Hackety Hack](http://hackety-hack.com) to teach programming to everyone. In order to reach all corners of the earth, \_why decided to make Hackety Hack work on Windows, Mac OS X, and Linux. This was a lot of work, and so \_why decided to share his toolkit with the world. Thus, Shoes was born.

Everybody loved Shoes. Many apps were made, and put into [The Shoebox](http://the-shoebox.org/). But, one day, \_why left. In his memory, Team Shoes assembled, and carried on making Shoes. They released Shoes version 3 in the late summer of 2010, but all was not good in Shoe-ville. You see, Shoes was barely held together by little bits of string. Three different platforms was a lot of work! And since \_why wasn't around to help, the code was confusing in places, and there were lots of little problems. Also, new versions of Windows and OSX came out after \_why's mysterious disappearance, and it was hard to test them all.

Therefore, Team Shoes decided upon a grand experiment. Shoes would become many different colored Shoes. And thus, Blue Shoes was born. Alongside it, there are also Green Shoes, built with GTK, and Brown Shoes, on JRuby. The original Shoes became Red Shoes.

But we're not here to talk about all those other Shoes... you care about Blue Shoes! It was started by the new champion of Hackety Hack, Steve Klabnik. Blue Shoes signifies the return of the union from which Shoes was originally born, and is made with Hackety Hack in mind. It's built on top of the QT library, which runs natively on all three platforms.

# Helping out with Blue Shoes

So you're intrigued, eh? Great! Blue Shoes is currently in the very nanescent stages of development, so there's lots of stuff to help with! The first thing you'll need to do is set up an environment.

## Setting up an environment

Blue Shoes works with Ruby 1.9.2. I'm using rvm, so to get 1.9.2, just `rvm install 1.9.2`, and wait!

If you don't have rvm, you can get it [here](http://rvm.beginrescueend.com/). If you don't want to use rvm... you should.

## Dependencies 

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

Bundler is gaining a lot of steam as a dependency management tool. So we're using it. To build your bundle, just type

    $ bundle install

and everything should get built.

# What works

Right now, very simple apps work. Check out the 'samples' directory for some examples.

# Stubs

All methods and classes should be stubbed out. I went through the manual, and I think I got everything. Some classes have nothing in them, though, so I'm sure I'm missing some things! This was done in like 10 hours, with 6 of them being sleep...

