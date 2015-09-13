" --------------------------------------------------------
"
213443" Vim
"
" Author:  @dmix
" Plugins: Managed using Plug.vim in config/plugins.vim
" Usecase: Go, Front-end (JS/CSS) & markdown notes
" Github:  https://github.com/dmix/dotfiles-vim/
"
" ---------------------------------------------------------
"
call plug#begin('~/.vim/plugged')

  " Experimental / new plugins that I might use
    Plug 'alx741/vinfo'
    Plug 'junegunn/goyo.vim'
    Plug 'facebook/vim-flow'
    Plug 'gorodinskiy/vim-coloresque'
    Plug 'maksimr/vim-jsbeautify'
    Plug 'mephux/vim-jsfmt',             { 'for': ['javascript'] }
    Plug 'Valloric/YouCompleteMe'
    Plug 'amix/vim-zenroom2'
    Plug 'marijnh/tern_for_vim',         { 'for': ['javascript'] }
    Plug 'Shougo/vimfiler.vim' " File navigation (ala :dir)
    " Plug 'Mizuchi/vim-ranger' " File explorer using ranger
    " Plug 'whatyouhide/vim-lengthmatters'

  " Colorscheme
    Plug 'cocopon/lightline-hybrid.vim'
    Plug 'kristijanhusak/vim-hybrid-material'
    Plug 'w0ng/vim-hybrid'

  " Navigation
    Plug 'majutsushi/tagbar' " Lists ctags in right sidebar
    Plug 'Shougo/unite.vim'
    Plug 'Shougo/neomru.vim'
    Plug 'gabesoft/vim-ags' " Ag search
    Plug 'jszakmeister/markdown2ctags' " markdown for tagbar

  " Tmux
    " Plug 'christoomey/vim-tmux-navigator'
    " Plug 'benmills/vimux'

  " Project management
    Plug 'mbbill/undotree'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'danro/rename.vim'

  " UI Additions
    Plug 'itchyny/lightline.vim'
    Plug 'wolf-dog/lightline-nighted.vim'
    Plug 'dzeban/vim-log-syntax'
    " Plug 'Townk/vim-autoclose.vim'
    Plug 'FooSoft/vim-argwrap'

  " Notes
    " Plug 'vim-pandoc/vim-pandoc-syntax'
    " Plug 'vim-pandoc/vim-pandoc-after'
    " Plug 'vim-pandoc/vim-pandoc'

  " Automatic Helpers
    Plug 'scrooloose/syntastic'
    Plug 'google/vim-maktaba'
    Plug 'google/vim-codefmt'
    Plug 'google/vim-glaive'
    Plug 'tomtom/tcomment_vim'

  " Language specific
    " Android
      Plug 'naseer/logcat'

    " Clojure

      Plug 'kien/rainbow_parentheses.vim', { 'for': ['clojure'] },
      Plug 'guns/vim-sexp',                { 'for': ['clojure'] },
      Plug 'guns/vim-clojure-highlight',   { 'for': ['clojure'] }
      Plug 'tpope/vim-fireplace',          { 'for': ['clojure'] }
      " look into: guns/vim-clojure-static,

    " Go
      Plug 'fatih/vim-go',                 { 'for': ['go'] }
      Plug 'garyburd/go-explorer',         { 'for': ['go'] }

    " Rust
      Plug 'rust-lang/rust.vim',           { 'for': ['rust'] }
      Plug 'cespare/vim-toml',             { 'for': ['toml'] }

    " JavaScript
      Plug 'pangloss/vim-javascript'
      Plug 'elzr/vim-json',                { 'for': ['javascript', 'json'] }
      Plug 'moll/vim-node'

    " CSS / HTML
      Plug 'mustache/vim-mustache-handlebars', { 'for': ['html', 'handlebars', 'mustache'] }
      Plug 'cakebaker/scss-syntax.vim',    { 'for': ['scss','sass']       }
      Plug 'hail2u/vim-css3-syntax',       { 'for': ['css','scss','sass'] }
      Plug 'othree/html5.vim',             { 'for': ['html']              }
      Plug 'groenewege/vim-less',          { 'for': ['less'] }

    " Markdown
      Plug 'godlygeek/tabular'
      Plug 'plasticboy/vim-markdown'

    function! InstallVimProc(info)
      if a:info.status == 'installed' || a:info.force
        silent !make
      endif
    endfunction

    Plug 'Shougo/vimproc.vim', { 'do': function('InstallVimProc') }

call plug#end()


" Config
" ----------------------------------------
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
set ruler
set laststatus=2
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set nu             " Line numbers on
set cmdheight=1    " Make the command area two lines high
set numberwidth=5
set encoding=utf-8
set cursorline
set ttyfast
set lazyredraw
set report=0 " Show all changes.
set shortmess=atI " Shorten command line text and other info tokens.
set showmode " Show the current mode.
set nostartofline " Don't jump to the start of the line when moving around.
if exists('+colorcolumn')
  set colorcolumn=80 " highlight three columns after 'textwidth'
endif

" Behaviors
" ----------------------------------------
set hidden             " Change buffer - without saving
set autowriteall       " Writes on make/shell commands
set iskeyword+=$,@,-     " Add extra characters that are valid parts of variables
set tags=./tags;/,tags;/
set paste

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
set smarttab " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces.
set autoindent
filetype plugin indent on

" Searching
" ----------------------------------------
set magic " Enable extended regexes.
set ignorecase
set smartcase  " Non-case sensitive search
set hlsearch
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
set backspace=start,indent,eol
set scrolloff=5 " start cursor three lines below
set title " Show the filename in the window titlebar.
" set diffopt=filler,vertical "Add vertical spaces to keep right and left aligned
" set diffopt+=iwhite " Ignore whitespace changes (focus on code changes)
" set guioptions=acg

" Configs
" ----------------------------------------

try
  call glaive#Install()
catch
endtry

runtime! keybindings.vim
runtime! plugins.vim

set noshowmode
set nospell
set nofoldenable
set nohlsearch

set diffopt=filler,vertical "Add vertical spaces to keep right and left aligned
set diffopt+=iwhite " Ignore whitespace changes (focus on code changes)

" Color scheme
" ------------------------------------------
let g:enable_bold_font = 1
set t_Co=256
colorscheme hybrid_reverse
let g:hybrid_use_Xresources = 1
syntax enable

" ----------------------------------------
" Note: original project sturcture based
" on dotfiles by Jeremy Mack (@mutewinter)
" ----------------------------------------
