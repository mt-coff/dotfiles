"==================================================
" vim-plug
"==================================================
if has('vim_starting')
	set rtp+=~/.vim/plugged/vim-plug
	if !isdirectory(expand('~/.vim/plugged/vim-plug'))
		echo 'install vim-plug...'
		call system('mkdir -p ~/.vim/plugged/vim-plug')
		call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
	end
endif

call plug#begin('~/.vim/plugged')
	Plug 'junegunn/vim-plug',
			\ {'dir': '~/.vim/plugged/vim-plug/autoload'}
	Plug 'w0rp/ale'
	Plug 'fatih/vim-go', {'for': 'go'}
	Plug 'editorconfig/editorconfig-vim'
	Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
	Plug 'mattn/emmet-vim', {'for': ['html', 'php', 'css', 'markdown', 'vue']}
	Plug 'posva/vim-vue', {'for': 'vue'}
	Plug 'othree/yajs.vim', {'for': 'javascript'}
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'jacoborus/tender.vim'
	Plug 'darthmall/vim-vue', {'for': 'vue' }
	Plug 'elmcast/elm-vim', {'for': 'elm'}
call plug#end()

"//////////////////////////////////////////////////

"==================================================
" general
"==================================================

" 文字コード
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
" インデント
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
" シンタックスハイライトを有効に
syntax on
" タイトル表示系
set notitle
set title
" 行を強調表示
set cursorline
" 行番号表示
set number
" ステータスラインを常時表示
set laststatus=2
" ルーラー表示
set ruler
" 折り返さず表示
set nowrap
" マウスの有効化
set mouse=a
set ttymouse=xterm2
" スワップファイル非作成
set noswapfile
" バックアップファイル非作成
set nobackup
" クリップボード系
set clipboard=unnamed,unnamedplus
" ftplugin
filetype plugin indent on

"--------------------------------------------------
" Mapping
"--------------------------------------------------

" jjをESCに割当てる
imap <silent> jj <ESC>
nmap <silent> <ESC><ESC> :nohlsearch<CR>
" 検索しジャンプ後に単語を画面中央へ
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
" vimrcをスペースドットで開けるように
nnoremap <space>. :<c-u>tabedit $MYVIMRC<CR>

"//////////////////////////////////////////////////

"--------------------------------------------------
" Search
"--------------------------------------------------

" インクリメンタルサーチ
set incsearch
" サーチ時に大文字小文字を無視
set ignorecase
" 検索文字列のハイライト
set hlsearch
" 検索最後尾から先頭へ
set wrapscan

"//////////////////////////////////////////////////
"//////////////////////////////////////////////////

"==================================================
" Plugins setting
"==================================================

"--------------------------------------------------
" color
"--------------------------------------------------

if &term =="xterm-256color"
	colorscheme tender
" 通常・行番号の背景色の無効化
	hi Normal ctermbg=none
	hi LineNr ctermbg=none
endif

"//////////////////////////////////////////////////

"--------------------------------------------------
" vim-editorconfig
"--------------------------------------------------

let g:editorconfig_verbose=1

"//////////////////////////////////////////////////

"--------------------------------------------------
" airline & airline theme
"--------------------------------------------------

let g:airline_theme='badwolf'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#let_sep=''
let g:airline#extensions#tabline#let_alt_sep='|'
"//////////////////////////////////////////////////
 
"--------------------------------------------------
" ALE
"--------------------------------------------------
 
let g:airline#extensions#ale#enabled = 1

"//////////////////////////////////////////////////
