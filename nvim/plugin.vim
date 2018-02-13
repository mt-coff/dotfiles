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
  Plug 'itchyny/lightline.vim'
  Plug 'w0rp/ale'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'Shougo/unite.vim'
  Plug 'lambdalisue/gina.vim'
  Plug 'ryanoasis/vim-devicons'
  " color
  Plug 'altercation/vim-colors-solarized'
  " langages
  Plug 'fatih/vim-go', {'do': 'GoInstallBinaries'}
  Plug 'zchee/deoplete-go', {'do': 'make'}
  Plug 'mattn/emmet-vim', {'for': ['html', 'css', 'markdown', 'vue']}
  Plug 'posva/vim-vue', {'for': 'vue'}
  Plug 'othree/yajs.vim', {'for': 'javascript'}
  Plug 'carlitux/deoplete-ternjs', {'do': 'npm install -g tern'}
call plug#end()

"==================================================
" plugins setting
"==================================================

" deopleteを使用
let g:deoplete#enable_at_startup = 1

" colorschemeを設定
set background=dark
colorscheme solarized

"lightline
let g:lightline = {
  \ 'colorscheme': 'solarized',
  \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
  \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly' ,'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'gina#component#repo#branch',
  \   'filetype': 'MyFiletype',
  \   'fileformat': 'MyFileformat'
  \ },
  \ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

" ALE
let g:airline#extensions#ale#enabled = 1

"neosnippet
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
