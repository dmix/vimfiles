" Strip trailing whitespace
" ------------------------------------------
:augroup whitespace
  fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
  endfun
  autocmd FileType * autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
:augroup END

" Custom tab spacing
" ------------------------------------------
:augroup tabgroup
  autocmd FileType make setlocal noexpandtab
  autocmd FileType html,hbs,javascript setlocal tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
:augroup END

" Fix incorrect filetypes
" ------------------------------------------
:augroup fixfiletypes
  autocmd BufNewFile,BufRead *.md,*.ref set filetype=markdown
  autocmd BufNewFile,BufRead *.exports*,*.profile*,*.bash*,.*zsh set filetype=sh
  " autocmd Filetype markdown,html set spell
  " autocmd BufNewFile,BufRead *.ref set nospell
:augroup END

" Use Vim's syntax from :messages on *.logs
" ------------------------------------------
autocmd BufNewFile,BufReadPost *messages* :set filetype=messages
