" --------------------------------------------------------
"
" Author:  @dmix
" Plugins: Managed using Plug.vim in config/plugins.vim
" Usecase: Go, Front-end (JS/CSS) & markdown notes
" Github:  https://github.com/dmix/dotfiles-vim/
"
" ---------------------------------------------------------

" Plugins
" ---------------------------------------------------------
call plug#begin('~/.vim/plugged')

  " Experimenting / Learning
		Plug 'mhinz/vim-startify' " new start page
		Plug 'junegunn/vim-easy-align' " auto align blocks of text
		Plug 'airblade/vim-gitgutter' " adds changes +/- to gutter
		Plug 'itchyny/calendar.vim'
		Plug 'cohama/agit.vim' " git log viewer
		Plug 'jceb/vim-hier' " highlight quickfix errors

  " Color scheme
    Plug 'w0ng/vim-hybrid'
    Plug 'kristijanhusak/vim-hybrid-material'
    Plug 'rafi/vim-tinyline'
    Plug 'edkolev/tmuxline.vim'
    Plug 'gorodinskiy/vim-coloresque'

  " Navigation
    Plug 'Shougo/vimfiler.vim'
    Plug 'Shougo/unite.vim'
    Plug 'Shougo/neomru.vim'
    Plug 'gabesoft/vim-ags' " Ag search
    Plug 'majutsushi/tagbar' " Lists ctags in right sidebar
    Plug 'jszakmeister/markdown2ctags' " markdown for tagbar

  " Tmux
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'benmills/vimux'

  " Project management
    Plug 'mbbill/undotree'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'danro/rename.vim'

  " UI Additions
		Plug 'cohama/lexima.vim'
    " Plug 'FooSoft/vim-argwrap'

  " Writing + Notes
    Plug 'junegunn/goyo.vim'
    Plug 'amix/vim-zenroom2'
    " Plug 'vim-pandoc/vim-pandoc-syntax'
    " plug 'vim-pandoc/vim-pandoc-after'
    " plug 'vim-pandoc/vim-pandoc'

  " automatic helpers
    Plug 'scrooloose/syntastic'
    Plug 'google/vim-maktaba'
    Plug 'google/vim-codefmt'
    Plug 'google/vim-glaive'
    Plug 'tomtom/tcomment_vim'

  " Language specific
    " Android
      Plug 'naseer/logcat'

    " Go
      Plug 'fatih/vim-go',                 { 'for': ['go'] }
      Plug 'garyburd/go-explorer',         { 'for': ['go'] }

    " Rust
      Plug 'cespare/vim-toml',             { 'for': ['toml'] }
      " Plug 'rust-lang/rust.vim',           { 'for': ['rust'] }

    " Clojure
      " Plug 'kien/rainbow_parentheses.vim', { 'for': ['clojure'] },
      " Plug 'guns/vim-sexp',                { 'for': ['clojure'] },
      " Plug 'guns/vim-clojure-highlight',   { 'for': ['clojure'] }
      " Plug 'tpope/vim-fireplace',          { 'for': ['clojure'] }
      " look into: guns/vim-clojure-static,

    " JavaScript
      Plug 'pangloss/vim-javascript'
    	" Plug 'maksimr/vim-jsbeautify'
    	" Plug 'mephux/vim-jsfmt',             { 'for': ['javascript'] }
      Plug 'elzr/vim-json',                { 'for': ['javascript', 'json'] }
      Plug 'moll/vim-node'

    " CSS / HTML
      Plug 'mustache/vim-mustache-handlebars', { 'for': ['html', 'handlebars', 'mustache'] }
      Plug 'othree/html5.vim',             { 'for': ['html']              }
      Plug 'hail2u/vim-css3-syntax',       { 'for': ['css','scss','sass'] }
      Plug 'cakebaker/scss-syntax.vim',    { 'for': ['scss','sass']       }
      Plug 'groenewege/vim-less',          { 'for': ['less'] }

    " Markdown
      Plug 'godlygeek/tabular'
      Plug 'plasticboy/vim-markdown'

		" Purgatory
    " Plug 'marijnh/tern_for_vim',         { 'for': ['javascript'] }
    " Plug 'alx741/vinfo'
    " Plug 'Valloric/YouCompleteMe'
    " Plug 'Mizuchi/vim-ranger' " File explorer using ranger
    " Plug 'whatyouhide/vim-lengthmatters'

    function! InstallVimProc(info)
      if a:info.status == 'installed' || a:info.force
        silent !make
      endif
    endfunction

    Plug 'Shougo/vimproc.vim', { 'do': function('InstallVimProc') }
call plug#end()


" Config
" ----------------------------------------
set shell=/bin/zsh
set nocompatible
set clipboard=unnamedplus
set history=1000 " Increase history from 20 default to 1000
if has('persistent_undo')
  set undofile
  set undodir=~/.vim/.undo
endif


" Backups
" ----------------------------------------
set noswapfile
set directory=~/.vim-tmp,~/tmp,/var/tmp,/tmp
set backupdir=~/.vim-tmp,~/tmp,/var/tmp,/tmp


" UI
" ----------------------------------------s
set textwidth=78
set nu             " line numbers on
set cmdheight=1    " make the command area two lines high
set numberwidth=5
set cursorline
set ttyfast
set lazyredraw
set report=0 " show all changes.
set shortmess=ati " shorten command line text and other info tokens.
set showmode " show the current mode.
set nostartofline " don't jump to the start of the line when moving around.

if exists('+colorcolumn')
  set colorcolumn=80 " highlight three columns after 'textwidth'
endif

if has('statusline')
	set laststatus=2
	" Broken down into easily includeable segments
	set statusline=%<%f\    " Filename
	set statusline+=%w%h%m%r " Options
	set statusline+=%{fugitive#statusline()} "  Git Hotness
	set statusline+=\ [%{&ff}/%Y]            " filetype
	set statusline+=\ [%{getcwd()}]          " current dir
	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*
	let g:syntastic_enable_signs=1
	set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif


" Behaviors
" ----------------------------------------
set hidden             " Change buffer - without saving
set autowriteall       " Writes on make/shell commands
set iskeyword+=$,@,-     " Add extra characters that are valid parts of variables


" Folding
" ----------------------------------------
" au FileType javascript call JavaScriptFold()
" set foldmethod=syntax " Markers are used to specify folds.
" set foldlevel=1


" Tabs
" ----------------------------------------
set tabstop=2 " size of a hard tabstop
set shiftwidth=2 " size of indent
set expandtab " Expand tabs to spaces.


" Searching
" ----------------------------------------
set magic " Enable extended regexes.
set ignorecase
set smartcase  " Non-case sensitive search
set wildignore+=.final_builds/*,*/tmp/*,*/node_modules/*,*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,.sass-cache,*.class,*.scssc,*/Godeps/*
if executable('ag')
  set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
  set grepformat=%f:%l:%c:%m
endif


" Visual
" ----------------------------------------
set showmatch   " Show matching brackets.
set matchtime=2 " How many tenths of a second to blink


" Sounds
" ----------------------------------------
set noerrorbells
set novisualbell


" Mouse
" ----------------------------------------
set mousehide  " Hide mouse after chars typed
set mouse=a  " Mouse in all modes


" Experimental
" ----------------------------------------
set title " Show the filename in the window titlebar.
set display+=lastline
try
  call glaive#Install()
catch
endtry



" Color scheme
" ------------------------------------------
set t_Co=256
colorscheme hybrid_reverse
" set paste
let g:enable_bold_font = 1


" Config from vim-sensible
" ------------------------------------------
if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Use :help 'option' to see the documentation for the given option.

set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab

set nrformats-=octal

set ttimeout
set ttimeoutlen=100

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

set ruler
set showcmd
set wildmenu

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif

set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

if &shell =~# 'fish$'
  set shell=/bin/bash
endif

set autoread
set fileformats+=mac

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif



" Source files
" ------------------------------------------
runtime! keybindings.vim
runtime! plugins.vim


" Always silent the command
" inoremap <silent> <SID>AutoPairsReturn <C-R>=AutoPairsReturn()<CR>
" imap <script> <Plug>AutoPairsReturn <SID>AutoPairsReturn
" imap <silent> <CR> <C-R>=AutoPairsReturn()<CR>
" let g:AutoPairsMapCR = 0
" au BufEnter * :call AutoPairsTryInit()
