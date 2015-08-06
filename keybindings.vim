"
" Keybindings
" ----------------------------------------

let g:mapleader="\<Space>"

" Navigation
" ---------------------------------------------------------------------
nnoremap <C-N> :VimFiler<CR>
nnoremap <C-n> :VimFiler<CR>
" nnoremap <C-n> :Unite -vertical file_rec<CR>
nnoremap <C-p> :Unite -no-split -buffer-name=files -start-insert file_rec/async:!<cr>
nnoremap <leader>b :Unite buffer<CR>
nnoremap <leader>B :Unite bookmarks<CR>
nnoremap <leader>p :Unite -no-split -buffer-name=mru -start-insert file_mru<cr>
nnoremap <leader>/ :Unite -no-split grep:.<cr>
nnoremap <leader>y :Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :Unite -no-split -buffer-name=buffer  buffer<cr>
nnoremap <leader>d <Esc>:bd<cr>
nnoremap <leader>n <Esc>:bn<cr>

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
