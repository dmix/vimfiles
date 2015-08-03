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

" Apply textwidth=72 on save
" ------------------------------------------
:augroup autogq
  autocmd FileType * setlocal tw=72
  autocmd FileType markdown,pandoc setlocal tw=72 fo=cqt wm=0
:augroup END

" Filetype based commands or buffwrites
" ------------------------------------------
:augroup filecommandsgroup
  autocmd FileType go noremap <buffer> <c-f> :GoFmt<cr>
  autocmd FileType javascript noremap <buffer> <c-f> :call JsBeautify()<cr>
  autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
  autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
:augroup END


" Custom tab spacing
" ------------------------------------------
:augroup tabgroup
  autocmd FileType make setlocal noexpandtab
  autocmd FileType html,hbs,javascript setlocal tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
  autocmd FileType go setlocal tabstop=4 shiftwidth=4 noexpandtab
  " autocmd FileType go autocmd BufWritePre <buffer> GoFmt
:augroup END

" Fix incorrect filetypes
" ------------------------------------------
:augroup fixfiletypes
  autocmd BufNewFile,BufRead *.md,*.ref set filetype=markdown
  autocmd BufNewFile,BufRead *.exports*,*.profile*,*.bash*,.*zsh set filetype=sh
  autocmd BufNewFile,BufRead jshint*,.jshint* set filetype=javascript
  " autocmd Filetype markdown,html set spell
  " autocmd BufNewFile,BufRead *.ref set nospell
:augroup END

" Use Vim's syntax from :messages on *.logs
" ------------------------------------------
autocmd BufNewFile,BufReadPost *messages* :set filetype=messages
