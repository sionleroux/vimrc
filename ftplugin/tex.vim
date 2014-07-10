" Options for LaTeX Suite
if exists('+shellslash')
    set shellslash
endif
set grepprg=grep\ -nH\ $*
let g:Tex_DefaultTargetFormat='pdf'

" LaTeX looks nicer with 2 spaces for indentation
setlocal tabstop=2     " a tab is now TWO spaces
setlocal shiftwidth=2  " number of spaces to use for autoindenting

" latex-suite does really dumb things with the quickfix window if buffers
" are hidden instead of deleted
set nohidden

" set PDF reader to AcroRead when on Windows™
" (apparently it can't do this by itself)
if has("win95") || has("win16") || has("win32") || has("win64")
    let g:Tex_ViewRule_pdf = 'AcroRd32' "Windows™ Only
endif

if has("autocmd")
    autocmd VimLeave,BufDelete *.tex
                \ silent
                \ !find "<afile>:h" -type f |
                \ grep -sE '\.(aux|log|nav|out|snm|toc)$' |
                \ xargs rm -f
endif
