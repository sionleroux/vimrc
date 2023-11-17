"" (Most of this copy-pasted from ftplugin/markdown.vim, consider sourcing!)
setlocal spell spelllang=en_gb

"" the future is wrapping!
set wrap
set tw=0
set linebreak

"" 4-space indentation specially for code blocks
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab

nnoremap <silent> <leader>uu :call vimwiki#base#linkify()<cr>
"" override vimwiki to make the concealment editable, otherwise it's impossible
"" to navigate into inside a link in normal mode
setlocal concealcursor=
