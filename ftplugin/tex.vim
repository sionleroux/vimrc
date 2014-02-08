" Options for LaTeX Suite
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'

" LaTeX looks nicer with 2 spaces for indentation
" TODO: this seems to apply to all buffers which is not so nice
set tabstop=2     " a tab is now TWO spaces
set shiftwidth=2  " number of spaces to use for autoindenting

" latex-suite does really dumb things with the quickfix window if buffers
" are hidden instead of deleted
set nohidden

" set PDF reader to AcroRead when on Windows™
" (apparently it can't do this by itself)
if has("win95") || has("win16") || has("win32") || has("win64")
    let g:Tex_ViewRule_pdf = 'AcroRd32' "Windows™ Only
endif

if has("autocmd")
    " TODO: this is not very smart because it always deletes in $HOME
    " but it worked in Windows. Investigate!
    autocmd VimLeave *.tex !rm -f *.aux *.log *.nav *.out *.snm *.toc
endif
