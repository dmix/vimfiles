" ----------------------------------------
" Keybindings
" ----------------------------------------

" Note: This line MUST come before any <leader> mappings
let g:mapleader="\<Space>"

" Copy/paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
imap <C-v> <Esc><C-v>a
set pastetoggle=<F6>
map <F6> :set invpaste<CR>:set paste?<CR>

" Edit vimrc
map vrc :e ~/.vimrc
map vrp :e ~/.vim/config/plugin
map vrk :e ~/.vim/config/plugins/unite.vim

" Common commands
" map <C-n> :VimFiler<CR>
" map <C-N> :VimFilerBufferDir<CR>
noremap <leader>2 :w !sudo tee %<CR>
inoremap jj <Esc>
nnoremap j gj
nnoremap k gk
command E Ex
nnoremap eee Ex<CR>
nnoremap qqq :q!<CR>

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


" reselect visual block after indent
vnoremap < <gv
vnoremap > >gv
" make Y consistent with C and D. See :help Y.
nnoremap Y y$
" Y in visual mode copies to system clipboard
vmap Y "+y

" Double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" ---------------
" Leader Commands
" ---------------

" Toggle spelling mode with <space>-s
nmap <silent> <leader>ss :set spell!<CR>
nmap <silent> <leader>sf :QuickSpellingFix<CR>

" Window Movement
" Equal Size Windows
nmap <silent> <leader>w= :wincmd =<CR>
" Swap Windows
nmap <silent> <leader>wx :wincmd x<CR>
" Window Splitting
nmap <silent> <leader>hs :split<CR>
nmap <silent> <leader>vs :vsplit<CR>
nmap <silent> <leader>sc :close<CR>

function! CRWriteIfNecessary()
  if !&modified || &readonly || &filetype == "qf"
    " Execute a normal enter when in Quickfix list.
    execute "normal! \<enter>"
  else
    :write
  endif
endfunction
function! MapCR()
  nnoremap <silent> <enter> :call CRWriteIfNecessary()<CR>
endfunction
call MapCR()

" Test runner {{{
" Run this file
map <leader>t :call RunTestFile()<cr>
" Run only the example under the cursor
map <leader>T :call RunNearestTest()<cr>
