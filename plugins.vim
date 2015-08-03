call plug#begin('~/.vim/plugged')

" Navigation
  Plug 'Shougo/unite.vim'
  Plug 'Shougo/vimfiler.vim'
  Plug 'Shougo/neomru.vim'
  Plug 'majutsushi/tagbar'

" Colorscheme
  Plug 'nanotech/jellybeans.vim'
  Plug 'whatyouhide/vim-gotham'

" UI Additions
  Plug 'itchyny/lightline.vim'
  Plug 'wolf-dog/lightline-nighted.vim'
  Plug 'scrooloose/syntastic'
  Plug 'whatyouhide/vim-lengthmatters'

" Note
  Plug 'vim-pandoc/vim-pandoc-syntax'
  Plug 'vim-pandoc/vim-pandoc-after'
  Plug 'vim-pandoc/vim-pandoc'

" Automatic Helpers
  Plug 'Valloric/YouCompleteMe'
  Plug 'google/vim-maktaba'
  Plug 'google/vim-codefmt'
  Plug 'google/vim-glaive'

  Plug 'tomtom/tcomment_vim'

" Language specific
  " Android
    Plug 'naseer/logcat'
    Plug 'dzeban/vim-log-syntax'

  " Ruby
    Plug 'vim-ruby/vim-ruby',           { 'for': ['ruby', 'rake'] }
    Plug 'tpope/vim-bundler',           { 'for': ['ruby', 'rake'] }

  " Go
    Plug 'fatih/vim-go'
    Plug 'garyburd/go-explorer'

  " Rust
    Plug 'rust-lang/rust.vim'
    Plug 'cespare/vim-toml'

  " JavaScript
    Plug 'pangloss/vim-javascript',      { 'for': ['javascript'] }
    Plug 'marijnh/tern_for_vim',         { 'for': ['javascript'] }
    Plug 'moll/vim-node',                { 'for': ['javascript'] }
    Plug 'jelera/vim-javascript-syntax', { 'for': ['javascript'] }
    Plug 'mxw/vim-jsx',                  { 'for': ['javascript'] }
    Plug 'maksimr/vim-jsbeautify',       { 'for': ['javascript'] }
    Plug 'elzr/vim-json',                { 'for': ['javascript', 'json'] }
    Plug 'kchmck/vim-coffee-script',     { 'for': ['coffee']     }

  " CSS / HTML
    Plug 'mustache/vim-mustache-handlebars'
    Plug 'rstacruz/sparkup',          { 'for': ['html', 'handlebars', 'mustache']        }
    Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss','sass']       }
    Plug 'hail2u/vim-css3-syntax',    { 'for': ['css','scss','sass'] }
    Plug 'othree/html5.vim',          { 'for': ['html']              }
    Plug 'groenewege/vim-less',       { 'for': ['less'] }

  " VimL
    Plug 'ynkdir/vim-vimlparser', { 'for': 'vim' }
    Plug 'syngan/vim-vimlint',    { 'for': 'vim' }

  " Markdown
    Plug '/plasticboy/vim-markdown', { 'for': 'markdown' }

  function! InstallVimProc(info)
    if a:info.status == 'installed' || a:info.force
      if has("unix")
        let s:uname = system("uname -s")
        if s:uname =~ "Darwin"
          silent !make -f make_mac.mak
        elseif s:uname =~ "Linux"
          silent !make
        else
          silent !gmake
        endif
      elseif has("win32unix")
        silent !make -f make_cygwin.mak
      elseif has('win32')
        silent !tools\update-dll-mingw
      endif
    endif
  endfunction

  Plug 'Shougo/vimproc.vim', { 'do': function('InstallVimProc') }

call plug#end()

