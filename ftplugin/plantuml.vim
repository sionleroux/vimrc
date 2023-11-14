augroup plantumlgen
    autocmd!
    autocmd BufWritePost *.uml,*.puml execute "silent !plantuml % &" | redraw
augroup END
