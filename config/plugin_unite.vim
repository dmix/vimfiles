" Unite
" ------------------------------------------
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ '\plugged/',
      \ ], '\|'))

if executable('pt')
  let g:unite_source_rec_async_command= 'pt --follow --nocolor --nogroup --hidden -g= ""'
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--column --nogroup --nogroup'
  let g:unite_source_grep_recursive_opt = ''
endif

" let g:unite_source_rec_max_cache_files = 99999

" See https://github.com/Shougo/unite.vim/issues/236#issuecomment-51983184
let g:unite_source_rec_unit = 250

let g:unite_source_history_yank_enable = 1
" call unite#filters#sorter_default#use(['sorter_rank'])
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <C-p> :Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>F :Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>r :Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>y :Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :Unite -no-split -buffer-name=buffer  buffer<cr>
nnoremap <leader>b :Unite -no-split -buffer-name=buffer  -start-insert buffer<cr>
nnoremap <leader>/ :Unite -no-split grep:.<cr>
