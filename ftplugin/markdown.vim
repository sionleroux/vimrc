" English spelling
setlocal spell spelllang=en_gb

" automatic linebreaks at 72 chars
set nowrap
set textwidth=72

" 4-space indentation specially for code blocks
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab

"" use web dictionary for lookups
call ref#register_detection('markdown', 'webdict')
