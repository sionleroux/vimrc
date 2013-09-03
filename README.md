# sinisterstuf's vimrc

This is my *vimrc*, including all plugins I use, so that I can keep it
up to date between my machines.

The following is a list of plugins I use:
 * [abolish](https://github.com/tpope/vim-abolish)
 * [bufexplorer](https://github.com/vim-scripts/bufexplorer)
 * [buffergator](https://github.com/vim-scripts/Buffergator)
 * [cd](https://github.com/vim-scripts/CD.vim)
 * [characterize](https://github.com/tpope/vim-characterize)
 * [commentary](https://github.com/tpope/vim-commentary)
 * [ctrlp](https://github.com/kien/ctrlp.vim)
 * [endwise](https://github.com/tpope/vim-endwise)
 * [eunuch](https://github.com/tpope/vim-eunuch)
 * [fugitive](https://github.com/tpope/vim-fugitive)
 * [latex-suite](https://github.com/jcf/vim-latex)
 * [markdown](https://github.com/tpope/vim-markdown)
 * [NrrwRgn](https://github.com/chrisbra/NrrwRgn)
 * [numbertoggle](https://github.com/jeffkreeftmeijer/vim-numbertoggle)
 * [obsession](https://github.com/tpope/vim-obsession)
 * [powerline](https://github.com/Lokaltog/vim-powerline/)
 * [ragtag](https://github.com/tpope/vim-ragtag)
 * [repeat](https://github.com/tpope/vim-repeat)
 * [rsi](https://github.com/tpope/vim-rsi)
 * [snipmate](https://github.com/msanders/snipmate)
 * [solarized](https://github.com/altercation/vim-colors-solarized)
 * [sparkup](https://github.com/tristen/vim-sparkup)
 * [speeddating](https://github.com/tpope/vim-speeddating)
 * [surround](https://github.com/tpope/vim-surround)
 * [unimpaired](https://github.com/tpope/vim-unimpaired)
 * [vimwiki](https://github.com/vimwiki/vimwiki)
 * [winmanager](https://github.com/vim-scripts/winmanager)

## Installation:

If you would like to use my *vimrc*, clone this repository to your home
directory and link the `vimrc` file from `.vimrc/vimrc` to `~/.vimrc`,
like this:

    cd ~
    git clone git://github.com/sinisterstuf/vimrc.git .vim
    cd .vim
    git submodule init
    git submodule update
    ln -s .vim/vimrc ../.vimrc

I've switched to using [git sub-modules](http://git-scm.com/book/en/Git-Tools-Submodules) now, so the actual plugin files
are no longer in my repository, just a `.gitmodules` file containing
directory and link information to install the plugins from their own
repositories.

### Windows:

If you're using Microsoft Windows™ then rename the `.vim` directory to
`.vimfiles` and make sure it's in your "User folder"
`C:\Users\YOURNAME\.vimfiles`. You'll also have to **copy** the `vimrc`
file to the parent folder instead of linking it, because that's the way
things are done on Microsoft Windows™!
**NOTE:** apparently in Windows™ 8 you can't use the file manager to
make a folder whose name starts with a dot, so you'll have to fire up
good ol' Windows™ command prompt to do [the renaming](http://www.microsoft.com/resources/documentation/windows/xp/all/proddocs/en-us/rename.mspx?mfr=true).

### Mac OSX

If you're using Mac OSX, I assume the process is similar to that on
GNU/Linux but nothing has been tested so don't complain if it does
nothing or breaks everything.

### Disclaimer

This configuration works for me, but it might not necessarily work for
you. You will probably want to read through the `vimrc` file and change
it a bit to suit your needs and possibly add/remove some plug-ins
depending on what you use vim for. I also accept **no responsibility**
if you install this on your system and anything gets damaged in any way.
