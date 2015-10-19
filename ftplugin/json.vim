command! Uglify %!uglifyjs --expr
command! Prettify %!uglifyjs --expr -b

set shiftwidth=2 tabstop=2
set nolist

" folding
set foldmethod=syntax
set foldnestmax=2
set foldlevel=1

" enable concealment
set conceallevel=2
