" turn off vi compatibility
set nocompatible

" Remove ALL autocommands for the current group.
autocmd!

" Setup Pathogen to load all bundles and their helptags
call pathogen#infect()
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" Show whitespace
set list
" GUI/Console specific character choices below
" highlight white space with special characters (this can be overridden in the
" if statement below)
set modeline list listchars=tab:»·,trail:·,nbsp:·,precedes:←,extends:→

if has('gui_running')
	""" GUI only options
	" bigger window
	set lines=38 columns=100
	" nice colour scheme
	colorscheme solarized
	set background=light
	so ~/.vim/bundle/solarized/autoload/togglebg.vim " enable F5 to toggle BG dark or light
	set guifont=Inconsolata-dz\ for\ Powerline\ Medium\ 10 "Linux Only
	let g:Powerline_symbols="fancy" "Only works when you're using a patched font
	" hide mouse when typing:
	set mousehide
	" add some custom menu options:
	:menu &MyVim.Convert\ Format.To\ Dos :set fileformat=dos<cr> :w<cr>
	:menu &MyVim.Convert\ Format.To\ Unix :set fileformat=unix<cr> :w<cr>
	:menu &MyVim.Remove\ Trailing\ Spaces\ and\ Tabs :%s/[	]*$//g<cr>
	:menu &MyVim.Remove\ Ctrl-M :%s///g<cr>
	:menu &MyVim.Remove\ All\ Tabs :retab<cr>
	" Ctrl-F1,F2,F3 Toggle the visibility of menubar, toolbar, scrollbar
	nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
	nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
	nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>
	""" Windows™ only options
	if has("win95") || has("win16") || has("win32") || has("win64")
		:set guioptions-=T	"remove toolbar (only useful on Windows™ cos it's ugly)
		set guifont=Consolas\ for\ Powerline\ FixedD:h11 "use patched Consolas font when on Windows™
	endif
else
	""" These options only apply when running without GUI
	set t_Co=16
	set background=dark
	colorscheme default
	if &term == "linux" || &term == "com25" || &term == "vt100"
		"show whitespace with simple characters (enable this for old/simple terminals)
		set listchars=tab:>.,trail:.,extends:#,nbsp:.
	endif
endif

" ALWAYS load powerline
set laststatus=2

" change the mapleader from \ to ,
let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Hide buffers on :e instead of closing them
set hidden

syntax enable on
filetype plugin indent on

if has('autocmd')
	" Use spaces for tabs in python
	autocmd filetype python set expandtab
	" Not sure what this does
	autocmd filetype html,xml set listchars=tab:>·
	" Don't remember what this does, it might be what starts where you were
	" last editing
	autocmd BufReadPost *
		\ if line("'\"") > 1 && line("'\"") <= line("$") |
		\   exe "normal! g`\"" |
		\ endif
	autocmd VimLeave *.tex !rm *.aux *.log *.nav *.out *.snm *.toc
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
set wildignore=*.swp,*.bak,*.pyc,*.class,*.pdf,*.aux,*.out,*.o,*.lol,*.lot,*.log
set ruler         " Not sure what it does
set cursorline
set encoding=utf-8 " UTF8 encoding

set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

" Toggle disable of auto-indent for pasting large code using F2
set pastetoggle=<F2>

" Enable mouse
if has('mouse')
	set mouse=a
endif

" Use ; instead of : for commands
nnoremap ; :

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" Easier window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

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

"Options for LaTeX Suite
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
" let g:Tex_ViewRule_pdf = 'AcroRd32' "Windows™ Only

" Set automatic linebreaks for Wiki files
au! BufRead,BufNewFile *.wiki set tw=72

" Some vimwiki settings
let wiki = {}
let wiki.path = '~/Projects/Web/vimwiki'
let wiki.path_html = '~/Projects/Web/www/vimwiki'
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
