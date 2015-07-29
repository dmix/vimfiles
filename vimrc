" --------------------------------------------------------
"
" Vim
"
" Author:  @dmix
" Plugins: Managed using Plug.vim in config/plugins.vim
" Usecase: Go, Front-end (JS/HTML/SCSS), & PanDoc notes
" Github:  https://github.com/dmix/dotfiles-vim/
"
" ---------------------------------------------------------

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
set textwidth=72
set report=0 " Show all changes.
set shortmess=atI " Shorten command line text and other info tokens.
set showmode " Show the current mode.
set nostartofline " Don't jump to the start of the line when moving around.
if exists('+colorcolumn')
  set colorcolumn=72 " Color the 80th column differently
endif

" Behaviors
" ----------------------------------------
set hidden             " Change buffer - without saving
set autowriteall       " Writes on make/shell commands
set iskeyword+=$,@,-     " Add extra characters that are valid parts of variables
set tags=./tags;/,tags;/
set nospell
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
set scrolloff=3 " start scrolling three lines before horizontal border of window.
set title " Show the filename in the window titlebar.
set diffopt=filler,vertical "Add vertical spaces to keep right and left aligned
set diffopt+=iwhite " Ignore whitespace changes (focus on code changes)
set noshowmode " Don't show the current mode (airline.vim takes care of us)
set ai " autoindent
set guioptions=acg

" Configs
" ----------------------------------------
runtime! plugins.vim
runtime! config/keybindings.vim
runtime! config/autocmds.vim
runtime! config/colors.vim

try
  call glaive#Install()
catch
endtry

" Plugins
" ----------------------------------------
runtime! config/plugin_autoclose.vim
runtime! config/plugin_golang.vim
runtime! config/plugin_json.vim
runtime! config/plugin_lightline.vim
runtime! config/plugin_signify.vim
runtime! config/plugin_syntastic.vim
runtime! config/plugin_tagbar.vim
runtime! config/plugin_unite.vim
runtime! config/plugin_undotree.vim
runtime! config/plugin_vimfiler.vim

set nospell
set nofoldenable
" ----------------------------------------
" Note: original project sturcture based
" on dotfiles by Jeremy Mack (@mutewinter)
" ----------------------------------------
