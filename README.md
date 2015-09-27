# sinisterstuf's vimrc

This is my *vimrc*, including all plugins I use, so that I can keep it
up to date between my machines.

## Installation:

If you would like to use my *vimrc*, clone this repository to your home
directory and link the `vimrc` file from `.vim/vimrc` to `~/.vimrc`,
like this:

    git clone --recursive git://github.com/sinisterstuf/vimrc.git "$HOME/.vim"
    ln -s "$HOME/.vim/vimrc" "$HOME/.vimrc"

I've switched to using [git sub-modules](http://git-scm.com/book/en/Git-Tools-Submodules) now, so the actual plugin files
are no longer in my repository, just a `.gitmodules` file containing
directory and link information to install the plugins from their own
repositories.

I use Tim Pope's [pathogen plugin](https://github.com/tpope/vim-pathogen)
to keep it all together.  Each plugin pathogen manages is a submodule
living in the `bundle` directory, so if you see some you like but don't
want my whole repo, just add the plugins you like, in a similar fashion.

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

## Plugin List

The following is a list of plugins I use:

 * [NrrwRgn](https://github.com/chrisbra/NrrwRgn)
 * [abolish](https://github.com/tpope/vim-abolish)
 * [airline](https://github.com/bling/vim-airline)
 * [ansiesc](https://github.com/vim-scripts/Improved-AnsiEsc)
 * [arduino-ino](https://github.com/jplaut/vim-arduino-ino)
 * [brainfuck-syntax](https://github.com/Beerstorm/vim-brainfuck)
 * [bufexplorer](https://github.com/vim-scripts/bufexplorer)
 * [buffergator](https://github.com/vim-scripts/Buffergator)
 * [cd](https://github.com/vim-scripts/CD.vim)
 * [characterize](https://github.com/tpope/vim-characterize)
 * [choosewin](https://github.com/t9md/vim-choosewin)
 * [commentary](https://github.com/tpope/vim-commentary)
 * [css-color](https://github.com/ap/vim-css-color.git)
 * [ctrlp](https://github.com/kien/ctrlp.vim)
 * [ddldbl](https://github.com/duff/vim-ddldbl)
 * [dispatch](https://github.com/tpope/vim-dispatch)
 * [easy-align](https://github.com/junegunn/vim-easy-align)
 * [editorconfig](https://github.com/editorconfig/editorconfig-vim)
 * [endwise](https://github.com/tpope/vim-endwise)
 * [eunuch](https://github.com/tpope/vim-eunuch)
 * [figlet](https://github.com/vim-scripts/Figlet.vim)
 * [fugitive](https://github.com/tpope/vim-fugitive)
 * [goyo](https://github.com/junegunn/goyo.vim)
 * [javascript](https://github.com/pangloss/vim-javascript)
 * [jdaddy](https://github.com/tpope/vim-jdaddy)
 * [latex-suite](https://github.com/jcf/vim-latex)
 * [lion](https://github.com/tommcdo/vim-lion)
 * [markdown](https://github.com/tpope/vim-markdown)
 * [numbertoggle](https://github.com/jeffkreeftmeijer/vim-numbertoggle)
 * [obsession](https://github.com/tpope/vim-obsession)
 * [php-manual](https://github.com/alvan/vim-php-manual)
 * [php-folding](https://github.com/rayburgemeestre/phpfolding.vim)
 * [projectionist](https://github.com/tpope/vim-projectionist)
 * [ragtag](https://github.com/tpope/vim-ragtag)
 * [rainbow](https://github.com/kien/rainbow_parentheses.vim)
 * [repeat](https://github.com/tpope/vim-repeat)
 * [repress](https://github.com/vim-scripts/VimRepress)
 * [rsi](https://github.com/tpope/vim-rsi)
 * [scratch](https://github.com/mtth/scratch.vim)
 * [scriptease](https://github.com/tpope/vim-scriptease)
 * [sensible](https://github.com/tpope/vim-sensible)
 * [sleuth](https://github.com/tpope/vim-sleuth)
 * [snipmate](https://github.com/msanders/snipmate.vim)
 * [solarized](https://github.com/altercation/vim-colors-solarized)
 * [sparkup](https://github.com/tristen/vim-sparkup)
 * [speeddating](https://github.com/tpope/vim-speeddating)
 * [splitjoin](https://github.com/AndrewRadev/splitjoin.vim)
 * [surround](https://github.com/tpope/vim-surround)
 * [tagbar](https://github.com/majutsushi/tagbar)
 * [tbone](https://github.com/tpope/vim-tbone)
 * [tern](https://github.com/marijnh/tern_for_vim)
 * [toggle](https://github.com/taku-o/vim-toggle)
 * [togglelist](https://github.com/milkypostman/vim-togglelist)
 * [unimpaired](https://github.com/tpope/vim-unimpaired)
 * [vimwiki](https://github.com/vimwiki/vimwiki)
 * [wakatime](https://github.com/wakatime/vim-wakatime)
 * [winmanager](https://github.com/vim-scripts/winmanager)
 * [wordpress](https://github.com/dsawardekar/wordpress.vim)
