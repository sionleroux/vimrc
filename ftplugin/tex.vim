" Options for LaTeX Suite
if exists('+shellslash')
    set shellslash
endif
set grepprg=grep\ -nH\ $*
let g:Tex_DefaultTargetFormat='pdf'

" LaTeX looks nicer with 2 spaces for indentation
setlocal tabstop=2     " a tab is now TWO spaces
setlocal shiftwidth=2  " number of spaces to use for autoindenting

" The future is wrapping!
set wrap
set tw=0
set linebreak

" latex-suite does really dumb things with the quickfix window if buffers
" are hidden instead of deleted
set nohidden

" set OS-specific PDF viewers
let g:Tex_ViewRule_pdf = 'xdg-open'
if system("uname") == "Darwin\n"
    let g:Tex_ViewRule_pdf = 'open'
endif
if has("win95") || has("win16") || has("win32") || has("win64")
    let g:Tex_ViewRule_pdf = 'AcroRd32' "Windows™ Only
endif

if has("autocmd")
    augroup filetype_tex
        autocmd!
        " Clean up LaTeX generated rubbish on close/exit
        autocmd VimLeave,BufDelete *.tex
                    \ silent
                    \ !find "<afile>:h" -type f |
                    \ grep -sE '\.(aux|log|nav|out|snm|toc)$' |
                    \ xargs rm -f
    augroup END
endif
