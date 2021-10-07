" turn off vi compatibility
set nocompatible
scriptencoding utf-8
set fileencodings=ucs-bom,utf-8,default,latin2

" Setup Pathogen to load all bundles and their helptags
call pathogen#infect('bundle/{}', '~/Hacking/vim/{}')
call pathogen#helptags()

" change the mapleader from \ to ,
let mapleader=","

" override these if the terminal is lame
colorscheme solarized
set cursorline
let g:lame_terminal = 0

" Stuff varying by OS or terminal is set here
if has('gui_running')
    """ GUI only options
    set background=light
    so ~/.vim/bundle/solarized/autoload/togglebg.vim " enable F5 to toggle BG dark or light
    " Linux font by default, override elsewhere as needed
    let s:myfontface = 'lin'
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
    " In fact hide them by default
    set go-=m " menubar
    set go-=T " toolbar
    set go-=r " scrollbar
    """ Windows™ only options
    if has("win95") || has("win16") || has("win32") || has("win64")
        set guioptions-=T  "remove toolbar (only useful on Windows™ cos it's ugly)
        let s:myfontface = 'win'
    endif
else
    """ These options only apply when running without GUI
    set ttyfast " more responsive tty in local

    " Fix for background transparency in non-solarized (black) terminals
    let g:solarized_termtrans = 1

    if &term == "xterm"
        let g:solarized_termcolors = 256
    endif

    " xterm: used by GNOME dropdown terminal
    " linux: used in tty
    if &term == "linux" ||
    \ &term == "com25" ||
    \ &term == "vt100" ||
    \ &term == "builtin_gui" ||
    \ &term == "screen"
        " lamer settings for weaker terminals
        let g:lame_terminal=1

        let g:airline_symbols = {}
        let g:airline_left_sep = '>'
        " set t_Co=16 " use less colours
        colorscheme default " give up on using solarized
        set nocursorline

    endif

    set background=dark " these terminals are either B&W or solarized dark
endif

if !g:lame_terminal

    set nottyfast " if it's lame it might be over network

    if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
        let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"

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
        let g:airline_symbols.paste = 'ρ'
        let g:airline_symbols.whitespace = 'Ξ'

        " Javascript concealment characters
        let g:javascript_conceal_function   = "ƒ"
        let g:javascript_conceal_null       = "ø"
        let g:javascript_conceal_this       = "@"
        let g:javascript_conceal_return     = "⇚"
        let g:javascript_conceal_undefined  = "¿"
        let g:javascript_conceal_NaN        = "ℕ"
        let g:javascript_conceal_prototype  = "¶"
        let g:javascript_conceal_static     = "•"
        let g:javascript_conceal_super      = "Ω"

    endif

endif

" Mac OSX Specific stuff
if has('unix')
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
        " A mouse mode is needed for iTerm2 on OSX:
        set ttymouse=xterm2
        let s:myfontface = 'mac'
        " Change iTerm2 cursor when changing modes
        let &t_SI = "\<Esc>]1337;CursorShape=1\x7"
        let &t_EI = "\<Esc>]1337;CursorShape=0\x7"
        " Ref reference viewer settings
        let g:ref_man_cmd = "man -P cat" " workaround to get man output on Mac
        let g:Tex_ViewRule_pdf = 'open' " to open generated PDFs on Mac
    endif
endif

" or copy paste the following into your vimrc for shortform text
let g:airline_mode_map = {
            \ '__' : '-',
            \ 'n'  : 'N',
            \ 'i'  : 'I',
            \ 'R'  : 'R',
            \ 'c'  : 'C',
            \ 'v'  : 'V',
            \ 'V'  : 'V',
            \ '' : 'V',
            \ 's'  : 'S',
            \ 'S'  : 'S',
            \ '' : 'S',
            \ }

" Rainbow Parentheses settings
nnoremap <Leader>rr :RainbowParentheses!!<CR>
let g:rainbow#pairs = [['(',')'], ['[',']'], ['{','}'], ['<%','%>']]

" list of fonts by OS and their sizes
let s:myfonts = {
            \ 'face' : {
                \ 'lin' : 'Inconsolata-dz for Powerline Medium ',
                \ 'mac' : 'InconsolataForPowerline:h',
                \ 'win' : 'Consolas for Powerline FixedD:h',
            \ },
            \ 'size' : ['8', '10', '14', '20']
            \ }

" convenience function for changing font size for OS font
function! s:setfontsize(size)

    " update current font size
    if a:size >= len(s:myfonts['size'])
        let s:myfontsize = 0
    else
        let s:myfontsize = a:size
    endif

    " use it
    let &guifont = s:myfonts['face'][s:myfontface] .
                \ s:myfonts['size'][s:myfontsize]
endfunction

" set regular font by default
if has('gui_running')
    call s:setfontsize(1) " Regular Size
endif

" Shortcuts to change font size
command! FontRegular call s:setfontsize(1)
command! FontSmall   call s:setfontsize(0)
command! FontLarge   call s:setfontsize(2)
command! FontHuge    call s:setfontsize(3)
command! FontBigger  call s:setfontsize(s:myfontsize + 1)
command! FontSmaller call s:setfontsize(s:myfontsize - 1)
nnoremap <Leader>fa :FontBigger<CR> " like C-A
nnoremap <Leader>fx :FontSmaller<CR> " like C-X

command! Slugify call
            \ setline(
            \   '.',
            \   join(
            \       split(
            \           tolower(
            \               substitute(
            \                   iconv(
            \                       getline('.'),
            \                       'utf8',
            \                       'ascii//TRANSLIT'
            \                   ),
            \                   "[\"']",
            \                   '',
            \                   'g'
            \               )
            \           ),
            \           '\W\+'
            \       ),
            \       '-'
            \   )
            \ )

command! Inception :exe "normal gUiw:s/./& · /g\ri*\e$xxxa*\ev0\"+d"

if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" Hack to fullscreen Gvim in GNOME
if has('gui_running')
    " TODO: figure out similar command for Awesome WM
    " Fullscreen command for GNOME
    command! FullScreenToggle call
        \ system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
    map <silent> <F11> :FullScreenToggle<CR>
endif

" Distraction free writing shortcut and personal hooks
nnoremap <Leader>go :Goyo<CR>

" Try making Goyo a bit wider
let g:goyo_width=80

function! s:goyo_enter()
    if has('gui_running')
        FullScreenToggle
        FontLarge
    endif
    set noshowmode
    set noshowcmd
    set scrolloff=999
    set sidescrolloff=0
    autocmd CursorHold * :echo
    NeoCompleteDisable
    Limelight
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()

function! s:goyo_leave()
    if has('gui_running')
        FontRegular
        FullScreenToggle
    endif
    set showmode
    set showcmd
    set scrolloff=1
    set sidescrolloff=5
    NeoCompleteEnable
    Limelight!
endfunction
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Enable mouse
if has('mouse')
    set mouse=nv
endif

" ALWAYS load statusline
set laststatus=2

" Quickly edit/reload the vimrc file
fun! OpenVimrc()
    if line('$') == 1 && getline(1) == ''
        e $MYVIMRC
    else
        sp $MYVIMRC
    endif
endf
nnoremap <silent> <leader>ev :call OpenVimrc()<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

syntax enable on
filetype plugin indent on

set nolist          " Show whitespace
set nowrap          " don't wrap lines
set tabstop=4       " a tab is four spaces
set shiftwidth=4    " number of spaces to use for autoindenting
set shiftround      " use multiple of shiftwidth when indenting with < and >
set expandtab       " use spaces instead of tabs
set backspace=indent,eol,start
                    " allow backspacing over everything in insert mode
set autoindent      " always set autoindenting on
set copyindent      " copy the previous indentation on autoindenting
set number          " always show line numbers
set relativenumber  " line numbers relative to cursor
set showmatch       " set show matching parenthesis
set ignorecase      " ignore case when searching
set smartcase       " ignore case if search pattern is all lowercase,
                    "    case-sensitive otherwise
set smarttab        " insert tabs on the start of a line according to
                    "    shiftwidth, not tabstop
set hlsearch        " highlight search terms
set incsearch       " show search matches as you type
set history=1000    " remember more commands and search history
set undolevels=1000 " use many muchos levels of undo
set ruler           " Not sure what it does
set autoread
set encoding=utf-8  " UTF8 encoding
set title           " change the terminal's title
set visualbell      " don't beep
set noerrorbells    " don't beep
set sessionoptions-=options " don't track options in sessions
set updatetime=100  " make gitgutter more snappy
set redrawtime=10000 " increase chance of syntax highlighting for long files

" Complete from dictionary when spelling is turned on
set complete+=kspell

" More powerful Ruby completion
let g:rubycomplete_buffer_loading = 1

" Enable neocomplete
let g:neocomplete#enable_at_startup = 1
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
if !exists('g:neocomplete#sources#omni#functions')
  let g:neocomplete#sources#omni#functions = {}
endif
" use xolox/vim-lua-ftplugin for lua completion:
let g:neocomplete#sources#omni#functions.lua =
        \ 'xolox#lua#omnifunc'
let g:neocomplete#sources#omni#input_patterns.lua =
        \ '\w\+[.:]\|require\s*(\?["'']\w*'

" Remove stupid mapping in sparkup
let g:sparkupNextMapping = '^J'

" Ctrl-P and file search-related
let g:ctrlp_working_path_mode = 'rc'
set wildignore+=*.swo,*.swp,*.bak,*.pyc,*.class,*.o
set wildignore+=*.pdf,*.aux,*.out,*.lol,*.lot,*.lof,*.toc
set wildignore+=*/node_modules/*,Session.vim
set suffixes+=.log
set wildmode=list:longest,full
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v.+/(tmp|temp)',
    \ }
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_extensions = ['Z', 'F']
nnoremap sz :CtrlPZ<Cr>
nnoremap sf :CtrlPF<Cr>

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

" Make Y yank until EOL as expected
" Using g_ instead of $ to not include the \n at EOL
map Y yg_

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

" My personal Wiki settings
let wiki = {}
let wiki.path = '~/wiki/'
let wiki.path_html = '~/Documents/wiki/'
let wiki.nested_syntaxes = {
            \ 'bash'  : 'bash',
            \ 'c'     : 'c',
            \ 'go'    : 'go',
            \ 'html'  : 'html',
            \ 'java'  : 'java',
            \ 'python': 'python',
            \ 'sql'   : 'sql'
            \ }
let g:vimwiki_ext2syntax = {'.md': 'markdown'}
let wiki.syntax = 'markdown'
let wiki.ext = '.md'
let wiki.auto_toc = 1
" Add above to Wiki list
let g:vimwiki_list = [wiki]
let g:vimwiki_global_ext = 0 " only handle defined wikis as wikis

" Add TodoList to Window Manager
"let g:winManagerWindowLayout = 'TodoList,FileExplorer|BufExplorer'
let g:winManagerWindowLayout = 'FileExplorer|BufExplorer'

" Use , for CamelCaseMotion
call camelcasemotion#CreateMotionMappings('<leader>')

" Fake fullscreen buffer within Vim
nnoremap <Leader>ff :tabe %<CR>

" Dispatch shortcuts
nnoremap <F9> :Make<CR>
nnoremap <F10> :Dispatch<CR>
" Toggle tagbar with F8
nmap <F8> :TagbarToggle<CR>
" Toggle Window Manager with <Leader>wm
nnoremap <Leader>wm :WMToggle<CR>

" command LoadGameTetris so ~/.vim/games/Tetris.vim
" command LoadGameXandO so ~/.vim/games/X-and-O.vim

let g:ref_source_webdict_sites = {
    \ 'default' : 'wiktionary',
    \ 'wiktionary' : {
        \ 'url'  : "https://en.wiktionary.org/wiki/%s",
        \ 'line' : 3,
        \ },
    \ }
let g:ref_source_webdict_cmd = 'lynx -dump -nonumbers %s'

" convert vimwiki page to HTML with <Leader>vh
nnoremap <Leader>vh :Vimwiki2HTML<CR>

" CD to directory of current file with <Leader>cd
nnoremap <Leader>cd :CD<CR>

" Toggle indentation with tabs/spaces(4) with F4
nnoremap <F4> :set et!<CR>:retab!<CR>

" Like the do and dp commands
nnoremap du :diffupdate<CR>

" Some tab shortcuts I feel are missing
nnoremap <Leader>tn :tabnext<CR>
nnoremap <Leader>tp :tabprevious<CR>
nnoremap <Leader>tq :tabclose<CR>
nnoremap <Leader>tu :tabnew<CR>

" Close all other windows in this tab (useful for hiding diffs)
nnoremap <Leader>o :only<CR>

" Git-related shortcuts for fugitive commands
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gw :Gwrite<CR>

if $PWD ==# $HOME
    let g:fugitive_git_executable = 'yadm'
endif

" Let fugitive's Gbrowse recognise Adevinta's GitHub Enterprise domain
let g:fugitive_github_domains = ['github.mpi-internal.com']

" Make gists in Adevinta's gists
let g:gist_api_url = 'https://github.mpi-internal.com/api/v3'

" Choose windows by letter
nmap  -  <Plug>(choosewin)

" Make .tex files always tex, not plaintex
let g:tex_flavor='latex'

let g:splitjoin_split_mapping = 'sj'
let g:splitjoin_join_mapping = 'sk'

" Delete comment character when joining commented lines
if v:version > 703 || v:version == 703 && has("patch541")
    set formatoptions+=j
endif

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

" Ignore superfluous non-error output
set errorformat^=%-Gsass\ %f\ >%m
set errorformat^=%-Gcp\ %f\ %m
set errorformat^=%-Gmkdir\ %f
set errorformat^=%-Grm\ %f

" PHP Mess detector
let &errorformat = &errorformat . ",%f:%l\t%m"

" turn off automatic semantic syntax highlighting
" because it doesn't really work because luainspect tool can't find imports
let g:lua_inspect_events = ''
" prepare to use neocomplete with xolox/vim-lua-ftplugin
let g:lua_check_syntax = 0
let g:lua_complete_omni = 1
let g:lua_complete_dynamic = 0
let g:lua_define_completion_mappings = 0


if has('autocmd')
    augroup sinisterstuf
        " Remove ALL autocommands for the current group.
        autocmd!

        " Hide buffers on :e instead of closing them
        autocmd BufRead,BufNewFile */sion/* setlocal bufhidden=hide

        " Recall the last line you were editing
        autocmd BufReadPost *\(.git/COMMIT_EDITMSG\)\@<!
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \   exe "normal! g`\"" |
                    \ endif

        " Turn on English spell-checking automatically
        autocmd filetype gitcommit,vimwiki,mail setlocal spell spelllang=en_gb

        " Set foldmethod for config files
        autocmd BufRead,BufNewFile */.config/* setlocal foldmethod=marker

        " Regenerate gotags on save
        autocmd BufWritePost *.go
                    \ execute "silent !gotags -silent -R %:h -f %:h/tags" |
                    \ redraw!

    augroup END
endif "autocmd
