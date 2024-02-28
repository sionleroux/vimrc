" Spelling and formatting
set spell spelllang=en_gb
set textwidth=80

" Convenience mappings
nnoremap <Leader>gx :GoRename<CR>
nnoremap <Leader>gr :GoRun<CR>
" ,gb Already taken by :GBlame
nnoremap <Leader>gg :GoBuild<CR>
nnoremap <Leader>gi :GoImports<CR>
nnoremap <Leader>gt :GoTestFunc<CR>
" Cast int to float64
nnoremap <Leader>g6 :normal ysia)ifloat64<CR>
" Show all declarations of this directory in a Ctrl-P window
nnoremap <Leader>gp :GoDecls<CR>
nnoremap <Leader>gl :GoCallers<CR>
" Mneumonic gl the L is because it opens it in the location list
nnoremap zh :GoSameIdsAutoToggle<CR>

command A :GoAlternate

" Use Dispatch for Go building commands
let g:go_dispatch_enabled = 1
let b:dispatch="go run %"

let g:go_doc_balloon = 1

" Auto show some stuff
" let g:go_auto_sameids = 1
let g:go_auto_type_info = 1
let g:go_updatetime = 0

let g:go_fmt_options = {
    \ 'goimports': '-local github.mpi-internal.com github.com/sinisterstuf',
    \ }

" Set tagbar options for Go
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

