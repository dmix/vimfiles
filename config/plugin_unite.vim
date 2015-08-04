" Unite
" ------------------------------------------

call unite#custom#profile('default', 'context', {
\   'start_insert': 1,
\   'winheight': 10,
\   'direction': 'botright',
\ })

" See https://github.com/Shougo/unite.vim/issues/236#issuecomment-51983184
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#filters#matcher_default#use(['matcher_fuzzy'])
let g:unite_source_rec_unit = 500
let g:unite_source_rec_max_cache_files = 99999
let g:unite_source_history_yank_enable = 1

if executable('pt')
  let g:unite_source_rec_async_command= 'pt'
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = ''
  let g:unite_source_grep_recursive_opt = ''
endif
"
nnoremap <C-n> :Unite -vertical file_rec/async<CR>
nnoremap <C-N> :Unite -vertical file_rec<CR>
nnoremap <C-p> :Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>/ :Unite -no-split grep:.<cr>
nnoremap <leader>b :Unite bookmark buffer<CR>
nnoremap <leader>r :Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>p :Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>y :Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :Unite -no-split -buffer-name=buffer  buffer<cr>
nnoremap <leader>d :bd<cr>
" nnoremap <leader>b :Unite -no-split -buffer-name=buffer  -start-insert buffer<cr>


" map <Leader>uf :Unite -toggle -start-insert file_rec<CR>
" map <Leader>ug :exe 'silent Ggrep -i '.input("Pattern: ")<Bar>Unite quickfix -no-quit -auto-preview<CR>
" map <Leader>u* :exe 'silent Ggrep -i '.expand("<cword>")<Bar>Unite quickfix -no-quit<CR>
" map <Leader>ub :Unite -toggle -start-insert buffer<CR>
" map <Leader>uq :Unite -toggle quickfix<CR>
" map <Leader>ux :Unite command<CR>
" map <Leader>ut :Unite -toggle -start-insert tab<CR>
" map <Leader>up :Unite -toggle -start-insert process<CR>
"
" "Move back and forth through previous and next buffers
" nnoremap <Leader>p :buffers<CR>:buffer<Space>
" nnoremap <leader>n :bn<cr>
" nnoremap <Leader>b :bp<CR>
" nnoremap <Leader>m :bprev<CR>
" nnoremap <Leader>k :BufOnly<CR>
"
" The prefix key.
" nnoremap    [unite]   <Nop>
" nmap    f [unite]
"
" nnoremap <silent> [unite]c  :<C-u>UniteWithCurrentDir
"         \ -buffer-name=files buffer bookmark file<CR>
" nnoremap <silent> [unite]b  :<C-u>UniteWithBufferDir
"         \ -buffer-name=files buffer bookmark file<CR>
" nnoremap <silent> [unite]r  :<C-u>Unite
"         \ -buffer-name=register register<CR>
" nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>
" nnoremap <silent> [unite]f
"         \ :<C-u>Unite -buffer-name=resume resume<CR>
" nnoremap <silent> [unite]ma
"         \ :<C-u>Unite mapping<CR>
" nnoremap <silent> [unite]me
"         \ :<C-u>Unite output:message<CR>
" nnoremap  [unite]f  :<C-u>Unite source<CR>
"
" nnoremap <silent> [unite]s
"         \ :<C-u>Unite -buffer-name=files -no-split
"         \ jump_point file_point buffer_tab
"         \ file_rec:! file file/new<CR>
"
" call unite#custom#profile('default', 'context', {
" \   'start_insert': 1
" \ })
"
" autocmd FileType unite call s:unite_my_settings()
" function! s:unite_my_settings()"{{{
"   " Overwrite settings.
"
"   imap <buffer> jj      <Plug>(unite_insert_leave)
"   "imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
"
"   imap <buffer><expr> j unite#smart_map('j', '')
"   imap <buffer> <TAB>   <Plug>(unite_select_next_line)
"   imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
"   imap <buffer> '     <Plug>(unite_quick_match_default_action)
"   nmap <buffer> '     <Plug>(unite_quick_match_default_action)
"   imap <buffer><expr> x
"   nmap <buffer> x     <Plug>(unite_quick_match_jump)
"   nmap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
"   imap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
"   imap <buffer> <C-y>     <Plug>(unite_narrowing_path)
"   nmap <buffer> <C-y>     <Plug>(unite_narrowing_path)
"   nmap <buffer> <C-j>     <Plug>(unite_toggle_auto_preview)
"   nmap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
"   imap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
"   nnoremap <silent><buffer><expr> l
"           \ unite#smart_map('l', unite#do_action('default'))
"
"   let unite = unite#get_current_unite()
"   if unite.profile_name ==# 'search'
"     nnoremap <silent><buffer><expr> r     unite#do_action('replace')
"   else
"     nnoremap <silent><buffer><expr> r     unite#do_action('rename')
"   endif
"
"   nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')
"   nnoremap <buffer><expr> S      unite#mappings#set_current_filters(
"           \ empty(unite#mappings#get_current_filters()) ?
"           \ ['sorter_reverse'] : [])
"
"   imap <silent><buffer><expr> <C-s>     unite#do_action('split')
" endfunction"}}}
