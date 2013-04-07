vimrc
=====

This is my *vimrc* as well as all plugins I use, so that I can keep it up to date between my machines.

The following is a list of plugins I use:
 * abolish
 * bufexplorer
 * characterize
 * commentary
 * endwise
 * eunuch
 * latex-suite
 * NrrwRgn
 * obsession
 * powerline
 * repeat
 * rsi
 * snipmate
 * solarized
 * sparkup
 * speeddating
 * surround
 * unimpaired
 * vimwiki
 * winmanager

Installation:
------------

If you would like to use my *vimrc*, clone this repository to your home directory and link the `vimrc` file from `.vimrc/vimrc` to `~/.vimrc`, like this:

    cd ~
    git clone git://github.com/sinisterstuf/vimrc.git .vim
    cd .vim
    git submodule init
    git submodule update
    ln -s vimrc ../.vimrc

I've switched to using [git sub-modules](http://git-scm.com/book/en/Git-Tools-Submodules) now, so the actual plugin files are no longer in my repository, just a `.gitmodules` file containing directory and link information to install the plugins from their own repositories.

If you're using Microsoft Windows™ then rename the `.vim` directory to `.vimfiles` and make sure it's in your "User folder" `C:\Users\YOURNAME\.vimfiles`. You'll also have to **copy** the `vimrc` file to the parent folder instead of linking it, because that's the way things are done on Microsoft Windows™!

If you're using Mac OSX, I assume the process is similar to that on GNU/Linux but nothing has been tested so don't complain if it does nothing or breaks everything.

This configuration works for me, but it might not necessarily work for you. You will probably want to read through the `vimrc` file and change it a bit to suit your needs and possibly add/remove some plug-ins depending on what you use vim for. I also accept **no responsibility** if you install this on your system and anything gets damaged in any way, see the LICENSE.md file for more.
