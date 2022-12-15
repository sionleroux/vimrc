# sinisterstuf's vimrc

This is my personal *vimrc*, the configuration for the [Vim text
editor](http://www.vim.org/others.php), including all plugins I use, so
that I can keep it up to date between my machines.


## Installation:

If you would like to use my *vimrc*, clone this repository to your home
directory and link the `vimrc` file from `.vim/vimrc` to `~/.vimrc`,
like this:

    git clone --recursive https://github.com/sinisterstuf/vimrc.git "$HOME/.vim"
    ln -s "$HOME/.vim/vimrc" "$HOME/.vimrc"

If you want to use [VimShell](https://github.com/Shougo/vimshell.vim),
you need to build vimproc first:

    cd $HOME/.vim/bundle/vimproc && make

I've switched to using [git sub-modules](http://git-scm.com/book/en/Git-Tools-Submodules)
now, so the actual plugin files are no longer in my repository, just a
`.gitmodules` file containing directory and link information to install
the plugins from their own repositories.  If pulling in this repo causes
changes in the sub-modules, you update the referenced plugins like this:

    git submodule update --init

I use Tim Pope's [pathogen plugin](https://github.com/tpope/vim-pathogen)
to keep it all together.  Each plugin pathogen manages is a submodule
living in the `bundle` directory, so if you see some you like but don't
want my whole repo, just add the plugins you like, in a similar fashion.
Just remember to follow the instructions from the pathogen README first.


### Windows:

If you're using Microsoft Windows™ then rename the `.vim` directory to
`.vimfiles` and make sure it's in your "User folder"
`C:\Users\YOURNAME\.vimfiles`. You'll also have to **copy** the `vimrc`
file to the parent folder instead of linking it, because that's the way
things are done on Microsoft Windows™!

**NOTE:** apparently in Windows™ 8 you can't use the file manager to
make a folder whose name starts with a dot, so you'll have to fire up
good ol' Windows™ command prompt to do [the renaming](http://www.microsoft.com/resources/documentation/windows/xp/all/proddocs/en-us/rename.mspx?mfr=true).


### Mac OS X

If you're using Mac OS X, the process is similar to that shown for
GNU/Linux above but the default Vim installation distributed with the
operating system is out of date and you should install a new version
using [homebrew](http://brew.sh/):

    brew install vim


### Disclaimer

This configuration works for me, but it might not necessarily work for
you. You will probably want to read through the `vimrc` file and change
it a bit to suit your needs and possibly add/remove some plug-ins
depending on what you use Vim for. I also accept **no responsibility**
if you install this on your system and anything gets damaged in any way.


## Plugin List

The following is a list of plugins I use:

[abolish](https://github.com/tpope/vim-abolish)
[afterimage](https://github.com/tpope/vim-afterimage)
[airline](https://github.com/bling/vim-airline)
[ansiesc](https://github.com/vim-scripts/Improved-AnsiEsc)
[arduino](https://github.com/jplaut/vim-arduino-ino)
[argtextobj](https://github.com/vim-scripts/argtextobj.vim)
[bufexplorer](https://github.com/vim-scripts/bufexplorer.zip)
[buffergator](https://github.com/vim-scripts/Buffergator)
[cd](https://github.com/vim-scripts/CD.vim)
[characterize](https://github.com/tpope/vim-characterize)
[choosewin](https://github.com/t9md/vim-choosewin)
[coffee-script](https://github.com/kchmck/vim-coffee-script)
[commentary](https://github.com/tpope/vim-commentary)
[css-color](https://github.com/ap/vim-css-color)
[ctrlp](https://github.com/ctrlpvim/ctrlp.vim)
[ctrlp-z](https://github.com/amiorin/ctrlp-z)
[ddldbl](https://github.com/duff/vim-ddldbl)
[dispatch](https://github.com/tpope/vim-dispatch)
[DrawIt](https://github.com/vim-scripts/DrawIt)
[easy-align](https://github.com/junegunn/vim-easy-align)
[editorconfig](https://github.com/editorconfig/editorconfig-vim)
[endwise](https://github.com/tpope/vim-endwise)
[eunuch](https://github.com/tpope/vim-eunuch)
[FastFold](https://github.com/Konfekt/FastFold)
[fetch](https://github.com/kopischke/vim-fetch)
[figlet](https://github.com/vim-scripts/Figlet.vim)
[fugitive](https://github.com/tpope/vim-fugitive)
[gist](https://github.com/mattn/gist-vim)
[go](https://github.com/fatih/vim-go)
[gotests](https://github.com/buoto/gotests-vim)
[goyo](https://github.com/junegunn/goyo.vim)
[html5](https://github.com/othree/html5.vim)
[hugefile](https://github.com/mhinz/vim-hugefile)
[indent-object](https://github.com/michaeljsmith/vim-indent-object)
[javascript](https://github.com/pangloss/vim-javascript)
[jdaddy](https://github.com/tpope/vim-jdaddy)
[jekyll](https://github.com/parkr/vim-jekyll)
[latex-suite](https://github.com/jcf/vim-latex)
[limelight](https://github.com/junegunn/limelight.vim)
[lion](https://github.com/tommcdo/vim-lion)
[lua-ftplugin](https://github.com/xolox/vim-lua-ftplugin)
[lua-inspect](https://github.com/xolox/vim-lua-inspect)
[luarefvim](https://github.com/wsdjeg/luarefvim)
[markdown](https://github.com/tpope/vim-markdown)
[misc](https://github.com/xolox/vim-misc)
[neco-vim](https://github.com/Shougo/neco-vim)
[neocomplete](https://github.com/Shougo/neocomplete.vim)
[nginx](https://github.com/chr4/nginx.vim)
[NrrwRgn](https://github.com/chrisbra/NrrwRgn)
[numbertoggle](https://github.com/jeffkreeftmeijer/vim-numbertoggle)
[obsession](https://github.com/tpope/vim-obsession)
[openscad](git@github.com:sirtaj/vim-openscad.git)
[php](https://github.com/StanAngeloff/php.vim)
[php-folding](https://github.com/rayburgemeestre/phpfolding.vim)
[php-manual](https://github.com/alvan/vim-php-manual)
[phpcomplete](https://github.com/shawncplus/phpcomplete.vim)
[primary](https://github.com/google/vim-colorscheme-primary)
[projectionist](https://github.com/tpope/vim-projectionist)
[python-mode](https://github.com/klen/python-mode)
[ragtag](https://github.com/tpope/vim-ragtag)
[rainbow](https://github.com/junegunn/rainbow_parentheses.vim)
[repeat](https://github.com/tpope/vim-repeat)
[rsi](https://github.com/tpope/vim-rsi)
[scala](https://github.com/derekwyatt/vim-scala)
[scratch](https://github.com/mtth/scratch.vim)
[scriptease](https://github.com/tpope/vim-scriptease)
[sensible](https://github.com/tpope/vim-sensible)
[showtime](https://github.com/thinca/vim-showtime)
[sleuth](https://github.com/tpope/vim-sleuth)
[snippets](https://github.com/honza/vim-snippets)
[solarized](https://github.com/altercation/vim-colors-solarized)
[sparkup](https://github.com/sinisterstuf/vim-sparkup)
[speeddating](https://github.com/tpope/vim-speeddating)
[splitjoin](https://github.com/AndrewRadev/splitjoin.vim)
[sslsecure](https://github.com/chr4/sslsecure.vim)
[stay](https://github.com/kopischke/vim-stay)
[surround](https://github.com/tpope/vim-surround)
[swift](https://github.com/keith/swift.vim)
[tagbar](https://github.com/majutsushi/tagbar)
[tbone](https://github.com/tpope/vim-tbone)
[tern](https://github.com/marijnh/tern_for_vim)
[toggle](https://github.com/taku-o/vim-toggle)
[togglelist](https://github.com/milkypostman/vim-togglelist)
[ultisnips](https://github.com/SirVer/ultisnips)
[unimpaired](https://github.com/tpope/vim-unimpaired)
[vimwiki](https://github.com/vimwiki/vimwiki)
[vinegar](https://github.com/tpope/vim-vinegar)
[wakatime](ssh://git@github.com/wakatime/vim-wakatime)
[webapi](https://github.com/mattn/webapi-vim)
[wordpress](https://github.com/dsawardekar/wordpress.vim)
