"==================================================
" vim-plug
"==================================================

if has('vim_starting')
  set rtp+=~/.local/share/nvim/plugged/vim-plug
  if !isdirectory(expand('~/.local/share/nvim/plugged/vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -p ~/.local/share/nvim/plugged/vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.local/share/nvim/plugged/vim-plug/autoload')
  end
endif

call plug#begin('~/.local/share/nvim/plugged')
  " vim-plug
  Plug 'junegunn/vim-plug', {'dir': '~/.local/share/nvim/plugged/vim-plug/autoload'}
  " utils
  Plug 'Shougo/deoplete.nvim', {'do': 'UpdateRemotePlugins'}
  Plug 'Shougo/neosnippet'
  Plug 'Shougo/neosnippet-snippets'
  Plug 'honza/vim-snippets'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'cohama/lexima.vim'
  Plug 'w0rp/ale'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'lambdalisue/gina.vim'
  Plug 'Shougo/denite.nvim'
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'szw/vim-tags'
  Plug 'majutsushi/tagbar'
  Plug 'ryanoasis/vim-devicons'
  Plug 'itchyny/lightline.vim'
  Plug 'taohex/lightline-buffer'
  Plug 'maximbaz/lightline-ale'
  " color
  Plug 'altercation/vim-colors-solarized'
  " language related
  Plug 'fatih/vim-go',              { 'do': 'goinstallbinaries' }
  Plug 'zchee/deoplete-go',         { 'do': 'make' }
  Plug 'mattn/emmet-vim',           { 'for': ['html', 'css', 'markdown', 'vue'] }
  Plug 'posva/vim-vue',             { 'for': 'vue' }
  Plug 'othree/yajs.vim',           { 'for': 'javascript' }
  Plug 'carlitux/deoplete-ternjs',  { 'do': 'npm install -g tern' }
  Plug 'elzr/vim-json',             { 'for': 'json' }
call plug#end()

"==================================================
" plugins setting
"==================================================

" deopleteを使用
let g:deoplete#enable_at_startup = 1

" colorschemeを設定
set background=dark
colorscheme solarized

" lightline
let g:lightline = {
  \ 'colorscheme': 'solarized',
  \ 'tabline': {
  \   'left': [ [ 'bufferinfo' ],
  \             [ 'separator' ],
  \             [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
  \   'right': [ [ 'close' ], ],
  \ },
  \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
  \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly' ,'filename', 'modified', 'tagbar' ] ],
  \
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'linter_errors', 'linter_warnings', 'linter_ok' ],
  \              [ 'fileformat', 'fileencoding' ,'filetype' ] ],
  \ },
  \ 'component': {
  \   'separator': '',
  \ },
  \ 'component_expand': {
  \   'buffercurrent': 'lightline#buffer#buffercurrent',
  \   'bufferbefore': 'lightline#buffer#bufferbefore',
  \   'bufferafter': 'lightline#buffer#bufferafter',
  \   'linter_warnings': 'lightline#ale#warnings',
  \   'linter_errors': 'lightline#ale#errors',
  \   'linter_ok': 'lightline#ale#ok',
  \ },
  \ 'component_type': {
  \   'buffercurrent': 'tabsel',
  \   'bufferbefore': 'raw',
  \   'bufferafter': 'raw',
  \   'linter_warnings': 'warning',
  \   'linter_errors': 'error',
  \   'linter_ok': 'left',
  \ },
  \ 'component_function': {
  \   'gitbranch': 'LLGitBranch',
  \   'filetype': 'LLFiletype',
  \   'fileformat': 'LLFileformat',
  \   'bufferinfo': 'lightline#buffer#bufferinfo',
  \   'tagbar': 'LLTagbar',
  \ },
  \ }

function! LLFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! LLFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! LLGitBranch()
  return ('' . ' ' . gina#component#repo#branch())
endfunction

function! LLTagbar()
  return tagbar#currenttag('%s', '')
endfunction

" lightline-ale
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf05d"

" ale
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '❖'

" neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

imap <expr><TAB>
\ pumvisible() ? "\<C-n>" :
\ neosnippet#expandable_or_jumpable() ?
\    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets/snippets'

" deoplete-ternjs
let g:deoplete#sources#ternjs#filetypes = [
  \ 'jsx',
  \ 'javascript.jsx',
  \ 'vue',
  \ ]

" NERDTree
nnoremap <silent><C-e> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1
autocmd FileType nerdtree setlocal nolist
autocmd FileType nerdtree setlocal nocursorline
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" vim-tags
let g:vim_tags_auto_generate = 1

" emmet
let g:user_emmet_leader_key='<C-y>'
