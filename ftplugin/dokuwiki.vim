if has("autocmd")
    augroup filetype_dokuwiki
        autocmd!
        " Delete closed dokuwiki files from It'sAllText cache
        autocmd BufUnload *.doku silent !rm -f <afile>:p
    augroup END
endif
