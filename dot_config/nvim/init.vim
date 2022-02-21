set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set title
set cursorline
set number
set relativenumber
set laststatus=2
set ruler
set nowrap
set noswapfile
set nobackup
set clipboard=unnamed,unnamedplus
set hidden
set showtabline=2
set list
set completeopt=menuone
set incsearch
set ignorecase
set hlsearch
set wrapscan

filetype plugin indent on

imap <silent> jj <ESC>
nmap <silent> <ESC><ESC> :nohlsearch<CR>
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
nnoremap <space>. :<c-u>tabedit $MYVIMRC<CR>

if $HOME != $USERPROFILE && $GIT_EXEC_PATH != ''
  finish
end

if !filereadable(expand('~/.config/nvim/autoload/plug.vim'))
  execute '!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

if !exists('g:vscode')
  set listchars=tab:»\ ,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
endif

call plug#begin('~/.config/nvim/plugged')
  if !exists('g:vscode')
    Plug 'shaunsingh/nord.nvim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'nvim-lualine/lualine.nvim'
  endif
  Plug 'tpope/vim-surround'
call plug#end()

" laod config
lua require('config')
call map(sort(split(globpath(&runtimepath, '_config/*.vim'))), {->[execute('exec "so" v:val')]})
