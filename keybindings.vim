"
" Keybindings
" ----------------------------------------

let g:mapleader="\<Space>"

" Navigation
" ---------------------------------------------------------------------
nnoremap <C-N> :VimFilerBufferDir<CR>
nnoremap <C-n> :VimFilerExplorer<CR>
" nnoremap <C-n> :Unite -vertical file_rec<CR>
nnoremap <C-p> :Unite -buffer-name=files -start-insert file_rec<cr>
nnoremap <leader>b :Unite buffer<CR>
nnoremap <leader>B :Unite bookmarks<CR>
nnoremap <leader>p :Unite -vertical -buffer-name=mru -start-insert file_mru<cr>
nnoremap <leader>/ :Unite -no-split grep:.<cr>
nnoremap <leader>y :Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :Unite -no-split -buffer-name=buffer  buffer<cr>
nnoremap <leader>d <Esc>:bd<cr>
nnoremap <leader>n <Esc>:bn<cr>

"Move back and forth through previous and next buffers
" nnoremap <Leader>p :buffers<CR>:buffer<Space>
nnoremap <Leader>b :bp<CR>
nnoremap <leader>m :bn<cr>
" nnoremap <Leader>m :bprev<CR>
nnoremap <Leader>k :BufOnly<CR>

call unite#custom#profile('default', 'context', {
\   'start_insert': 1,
\   'winheight': 16,
\   'direction': 'dynamictop',
\ })

" See https://github.com/Shougo/unite.vim/issues/236#issuecomment-51983184
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#filters#matcher_default#use(['matcher_fuzzy'])
let g:unite_source_rec_unit = 250
let g:unite_source_rec_max_cache_files = 5000
let g:unite_source_history_yank_enable = 1
let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup',
		\  '--hidden', '-g', '']
" Leader
" ---------------------------------------------------------------------

nmap <silent> <leader>ss :set spell!<CR>
nmap <silent> <leader>sf :QuickSpellingFix<CR>

" Window Movement
nmap <silent> <leader>h :split<CR>
nmap <silent> <leader>v :vsplit<CR>
nmap <silent> <leader>sc :close<CR>
" Equal Size Windows
nmap <silent> <A-=>w= :wincmd =<CR>
" Swap Windows
nmap <silent> <A->> :wincmd x<CR>

" Core
" ---------------------------------------------------------------------

" Copy/paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
imap <C-v> <Esc><C-v>a
set pastetoggle=<F6>
map <F6> :set invpaste<CR>:set paste?<CR>
nnoremap Y y$
vmap Y "+y

" Edit vimrc
map vrc :e ~/.vimrc
map vrp :e ~/.vim/plugins.vim
map vrk :e ~/.vim/keybindings.vim

" Quick navigation
noremap < ^
noremap > $
vnoremap < <gv
vnoremap > >gv
noremap <leader>2 :w !sudo tee %<CR>
inoremap jj <Esc>
nnoremap j gj
nnoremap k gk

" Common typos
command! W w
command! Q q
command! WW w!
command! QQ q
command! WQ wq
command! Wq wq
imap jk <Esc>
map <F1> <Esc>
imap <F1> <Esc>
