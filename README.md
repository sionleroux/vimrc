vimrc
=====

This is my *vimrc* as well as all plugins I use, so that I can keep it up to date between my machines.

The following is a list of plugins I use:
* abolish
* repeat
* sparkup
* unimpaired
* xml-vim
* commentary
* snipMate
* speeddating
* vim-latex
* powerline
* solarized
* surround
* vimwiki

Installation:
------------

If you would like to use my *vimrc*, clone this repository to your home directory and link the `vimrc` file from `.vimrc/vimrc` to `~/.vimrc`, like this:

    cd ~
    wget git://github.com/sinisterstuf/vimrc.git
    ln -s .vim/vimrc .vimrc

If you're using Microsoft Windows™ then rename the `.vim` directory to `.vimfiles` and make sure it's in your "User folder" `C:\Users\YOURNAME\.vimfiles`. You'll also have to **copy** the `vimrc` file instead of linking it because that's the way things are done on Microsoft Windows™!

If you're using Mac OSX, I assume the process is similar to that on GNU/Linux but nothing has been tested so don't complain if it does nothing or breaks everything.

This configuration works for me, but it might not necessarily work for you. You will probably want to read through the `vimrc` file and change it a bit to suit your needs and possibly add/remove some plug-ins depending on what you use vim for. I also accept **no responsibility** if you install this on your system and anything gets damaged in any way, see the LICENSE.md file for more.
