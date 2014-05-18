" Open .doku files as DokuWiki
augroup filetypedetect
    au BufRead,BufNewFile *.doku setfiletype dokuwiki
augroup END
