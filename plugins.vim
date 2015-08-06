" ==> autocmds.vim <==
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
  autocmd BufNewFile,BufRead jshint*,.jshint* set filetype=javascript
  autocmd BufNewFile,BufRead *ignore,*.exports*,*.profile*,*.bash*,.*zsh set filetype=conf
  " autocmd Filetype markdown,html set spell
  " autocmd BufNewFile,BufRead *.ref set nospell
:augroup END

" Use Vim's syntax from :messages on *.logs
" ------------------------------------------
autocmd BufNewFile,BufReadPost *messages* :set filetype=messages


" ==> plugin_unite.vim <==
" Unite
" ---------------------------------------------------------------------

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
let g:unite_source_rec_async_command= 'ag --nocolor --nogroup --hidden -g ""'

" if executable('pt')
"   let g:unite_source_rec_async_command= 'pt'
"   let g:unite_source_grep_command = 'pt'
"   let g:unite_source_grep_default_opts = ''
"   let g:unite_source_grep_recursive_opt = ''
" endif
"

" ==> plugin_autoclose.vim <==
" ---------------------------------------------------------------------

" vim mode-switch lag fix
if ! has("gui_running")
  set ttimeoutlen=10
  augroup FastEscape autocmd!
    au InsertEnter * set timeoutlen=50
    au InsertLeave * set timeoutlen=1000
  augroup END
endif


" ==> plugin_golang.vim <==
" ---------------------------------------------------------------------

let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_snippet_engine = "neosnippet"
let g:go_fmt_autosave = 0

Glaive codefmt gofmt_executable='goimports'


"==> plugin_json.vim <==
" ---------------------------------------------------------------------

let g:vim_json_syntax_conceal = 0


"==> plugin_lengthmatters.vim <==
" ---------------------------------------------------------------------

let g:lengthmatters_on_by_default=1
let g:lengthmatters_start_at_colum=72


" ==> plugin_lightline.vim <==
" ---------------------------------------------------------------------

let g:lightline = {
  \ 'colorscheme': 'gotham',
  \ }


"==> plugin_paddoc.vim <==
" ---------------------------------------------------------------------

let g:pad#dir = "~/douments/notes"
let g:pad#local_dir = "notes"
let g:pad#default_format = "pandoc"


" ==> plugin_signify.vim <==
" ---------------------------------------------------------------------

let g:signify_update_on_bufenter = 0
let g:signify_sign_overwrite = 0
let g:signify_disable_by_default = 0


"==> plugin_syntastic.vim <==
" ---------------------------------------------------------------------

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_tidy_exec = 'tidy'
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_disabled_filetypes = ['java']


" ==> plugin_tagbar.vim <==
" ---------------------------------------------------------------------

let g:tagbar_type_css = {
            \ 'ctagstype' : 'Css',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
    \ }

let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
    \ }

nmap <F8> :TagbarToggle<CR>


" ==> plugin_undotree.vim <==
" ---------------------------------------------------------------------

nnoremap <leader>u :UndotreeToggle<cr>



" ==> plugin_vimfiler.vim <==
" ---------------------------------------------------------------------

let g:vimfiler_as_default_explore = 1
let g:vimfiler_safe_mode_by_default = 0



" Plugins Marked for removal
" ---------------------------------------------------------------------
  " Plug 'vim-ruby/vim-ruby',          { 'for': ['ruby', 'rake'] }
  " Plug 'tpope/vim-bundler',          { 'for': ['ruby', 'rake'] }
  " Plug 'rstacruz/sparkup',           { 'for': ['html', 'handlebars', 'mustache'] }
  " Plug 'whatyouhide/vim-gotham'

