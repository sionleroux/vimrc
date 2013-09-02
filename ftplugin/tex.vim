" latex-suite does really dumb things with the quickfix window if buffers
" are hidden instead of deleted
set nohidden

" set PDF reader to AcroRead when on Windows™
" (apparently it can't do this by itself)
if has("win95") || has("win16") || has("win32") || has("win64")
    let g:Tex_ViewRule_pdf = 'AcroRd32' "Windows™ Only
endif

if has("autocmd")
    autocmd VimLeave *.tex !rm *.aux *.log *.nav *.out *.snm *.toc
endif

"TODO: maybe set the indent to 2 and that other thing here:
