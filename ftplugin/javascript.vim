command! Uglify %!uglifyjs
command! Prettify %!uglifyjs -b

set shiftwidth=2 tabstop=2
set nolist

" folding
let b:javascript_fold=0
set foldmethod=syntax
set foldnestmax=1
set foldlevel=1

" gulp (probably put this somewhere wiser)
setlocal makeprg=gulp\ --no-color

" enable concealment
set conceallevel=2

" Tern mappings
nnoremap K :TernDoc<CR>
nnoremap gd :TernDef<CR>
nnoremap g= :TernRefs<CR>
nnoremap gr :TernRename<CR>
nnoremap g? :TernType<CR>
