" turn off vi compatibility
set nocompatible

" Remove ALL autocommands for the current group.
autocmd!

" Setup Pathogen to load all bundles and their helptags
call pathogen#infect()
call pathogen#helptags()
call pathogen#incubate()

" Show whitespace
set list
" Assume that non-tty terminals use the patched font (override it below for TTY)
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

" use old vim-powerline symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

" use solarized colour scheme by default
colorscheme solarized

" Stuff varying by OS or terminal is set here
if has('gui_running')
    """ GUI only options
    " bigger window
    set lines=38 columns=100
    set background=light
    so ~/.vim/bundle/solarized/autoload/togglebg.vim " enable F5 to toggle BG dark or light
    " Linux font by default, override elsewhere as needed
    set guifont=Inconsolata-dz\ for\ Powerline\ Medium\ 10
    " hide mouse when typing:
    set mousehide
    set mousemodel=popup_setpos "enable right-click context menu
    " add some custom menu options:
    :menu &MyVim.Convert\ Format.To\ Dos :set fileformat=dos<cr> :w<cr>
    :menu &MyVim.Convert\ Format.To\ Unix :set fileformat=unix<cr> :w<cr>
    :menu &MyVim.Remove\ Trailing\ Spaces\ and\ Tabs :%s/[  ]*$//g<cr>
    :menu &MyVim.Remove\ Ctrl-M :%s///g<cr>
    :menu &MyVim.Remove\ All\ Tabs :retab<cr>
    " Ctrl-F1,F2,F3 Toggle the visibility of menubar, toolbar, scrollbar
    nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
    nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
    nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>
    """ Windows™ only options
    if has("win95") || has("win16") || has("win32") || has("win64")
        :set guioptions-=T  "remove toolbar (only useful on Windows™ cos it's ugly)
        set guifont=Consolas\ for\ Powerline\ FixedD:h11 "use patched Consolas font when on Windows™
    endif
else
    """ These options only apply when running without GUI
    set t_Co=16 " use less colours
    set background=dark " these terminals are either B&W or solarized dark
    "xterm used by the dropdown terminal, but probably good for actual xterm too, screen used by GNU screen:
    if &term == "linux" ||
    \ &term == "com25" ||
    \ &term == "vt100" ||
    \ &term == "builtin_gui" ||
    \ &term == "xterm" ||
    \ &term == "screen"
        colorscheme default " give up on using solarized
    endif
endif

" Mac OSX Specific stuff
if has('unix')
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
        " A mouse mode is needed for iTerm2 on OSX:
        set ttymouse=xterm2
        " OSX won't use Inconsolate font unless you write it like this:
        set guifont=Inconsolata-dz\ for\ Powerline\ dz\ 10 "Linux Only
    endif
endif

" Enable mouse
if has('mouse')
    set mouse=a
endif

" ALWAYS load statusline
set laststatus=2

" change the mapleader from \ to ,
let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Hide buffers on :e instead of closing them
au BufRead,BufNewFile */sion/* setlocal bufhidden=hide

syntax enable on
filetype plugin indent on

if has('autocmd')
    " Use spaces for tabs in python
    autocmd filetype python set expandtab
    " recall the last line you were editing
    autocmd BufReadPost *\(.git/COMMIT_EDITMSG\)\@<!
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif "autocmd

set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set expandtab     " use spaces instead of tabs (originally this was only set for python)
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set history=1000    " remember more commands and search history
set undolevels=1000 " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class,*.pdf,*.aux,*.out,*.o,*.lol,*.lot,*.lof
set ruler         " Not sure what it does
set cursorline
set encoding=utf-8 " UTF8 encoding
scriptencoding utf-8

set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

if version > 702 " stuff that doesn't work in Vim 7.2 (thank you Centos 6!)
    set colorcolumn=+1 " mark the end of text-width with a dark line
endif

" Toggle disable of auto-indent for pasting large code using F2
set pastetoggle=<F2>

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" Turn spelling and off with ,se and ,sn
map <Leader>se :setlocal spell spelllang=en_gb<CR>
map <Leader>sh :setlocal spell spelllang=hu_hu<CR>
map <Leader>sd :setlocal spell spelllang=de_de<CR>
map <Leader>sn :setlocal nospell<CR>

" Clear search highlighting with ,/
nmap <silent> ,/ :nohlsearch<CR>

" Convenient command to see the changes you've made (compares
" buffer to original file)
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

" Get sudo (only useful on Linux)
cmap w!! w !sudo tee % >/dev/null

" Some vimwiki settings
let wiki = {}
if isdirectory($HOME . '/Documents') " this only exists on my laptop
    let wiki.path = '~/Documents/vimwiki'
endif
if isdirectory($HOME . '/Projects/Web/www') " same thing here
    let wiki.path_html = '~/Projects/Web/www/vimwiki'
endif
let wiki.nested_syntaxes ={'bash': 'bash', 'java': 'java'}
let g:vimwiki_list = [wiki]

" Make Enter / Shift-Enter insert newline below/above in command mode
map <S-Enter> O<Esc>
map <CR> o<Esc>

" Add TodoList to Window Manager
"let g:winManagerWindowLayout = 'TodoList,FileExplorer|BufExplorer'
let g:winManagerWindowLayout = 'FileExplorer|BufExplorer'

" Create/open/close folds with F9
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

" Toggle Window Manager with <Leader>wm
nnoremap <Leader>wm :WMToggle<CR>

" command LoadGameTetris so ~/.vim/games/Tetris.vim
" command LoadGameXandO so ~/.vim/games/X-and-O.vim

" convert vimwiki page to HTML with <Leader>vh
nnoremap <Leader>vh :Vimwiki2HTML<CR>

" CD to directory of current file with <Leader>cd
nnoremap <Leader>cd :CD<CR>

" Toggle indentation with tabs/spaces(4) with F4
nnoremap <F4> :set et!<CR>:retab!<CR>

" Choose windows by letter
nmap  -  <Plug>(choosewin)
let g:choosewin_overlay_enable = 1

" Make .tex files always tex, not plaintex
let g:tex_flavor='latex'

let g:splitjoin_split_mapping = 'sj'
let g:splitjoin_join_mapping = 'sk'

" Speedread integration
function! SpeedRead()
    if has('gui_running')
        !xterm -e speedread -w 500 %
    else
        !speedread -w 500 %
    endif
endfunction
command! SpeedRead call SpeedRead()
nnoremap <Leader>sr :SpeedRead<CR>
