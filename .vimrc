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
	Plug 'fatih/vim-go', {'for': 'go'}
	Plug 'neomake/neomake'
	Plug 'benjie/neomake-local-eslint.vim'
	Plug 'editorconfig/editorconfig-vim'
	Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
	Plug 'nathanaelkane/vim-indent-guides'
	Plug 'bronson/vim-trailing-whitespace'
	Plug 'mattn/emmet-vim', {'for': ['html', 'php', 'css', 'markdown']}
	Plug 'tyru/open-browser.vim'
	Plug 'kannokanno/previm'
	Plug 'AtsushiM/search-parent.vim', {'for': ['sass', 'scss']}
	Plug 'AtsushiM/sass-compile.vim', {'for': ['sass', 'scss']}
	Plug 'othree/yajs.vim', {'for': 'javascript'}
	Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'tomasr/molokai'
	Plug 'hynek/vim-python-pep8-indent'
	Plug 'Shougo/neocomplete.vim'
	Plug 'davidhalter/jedi-vim'
	Plug 'andviro/flake8-vim'
	Plug 'darthmall/vim-vue', {'for': 'vue' }
	Plug 'mopp/layoutplugin.vim'
	Plug 'buranelus/vim-vue-template'
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
" ftplugin関連
filetype plugin indent on
augroup MyGroup
	autocmd!
	autocmd BufRead,BufNewFile *.go setfiletype go
	autocmd BufRead,BufNewFile *.html setfiletype html
	autocmd BufRead,BufNewFile *.py setfiletype python
	autocmd BufRead,BufNewFile *.js setfiletype javascript
	autocmd BufRead,BufNewFile *.vue setfiletype vuejs
augroup END

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
	colorscheme molokai
" 通常・行番号の背景色の無効化
	hi Normal ctermbg=none
	hi LineNr ctermbg=none
endif

"//////////////////////////////////////////////////

"--------------------------------------------------
" neocomplete
"--------------------------------------------------

"起動時に有効化
let g:neocomplete#enable_at_startup=1
" 大文字入力まで大小非区別
let g:neocomplete#enable_smart_case=1
" 候補数
let g:neocomplete#max_list=20
" _区切り補完有効化
let g:neocomplete#enable_underbar_completion=1
" 3文字でインタックスをキャッシュ
let g:neocomplete#source#syntax#min_keyword_length=3
" 補完表示最小文字数
let g:neocomplete#enable_auto_completion_start_length=2
" <TAB>: 補完候補選択
inoremap <expr><TAB> pumvisible() ? "<C-n>": "\<TAB>"

"//////////////////////////////////////////////////

"--------------------------------------------------
" vim-editorconfig
"--------------------------------------------------

let g:editorconfig_verbose=1

"//////////////////////////////////////////////////

"--------------------------------------------------
" vim-indent-guides
"--------------------------------------------------

let g:indent_guides_enable_on_vim_startup=1

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
" typescript
"--------------------------------------------------

autocmd BufRead,BufNewFile *.ts set filetype=typescript
let g:typescript_compiler_binary='tsc'
let g:typescript_compiler_options=''

"//////////////////////////////////////////////////

"--------------------------------------------------
" CSS
" SASS
"--------------------------------------------------

"sass
let g:sass_compile_auto=1
let g:sass_compile_cdloop=5
let g:sass_compile_file=['scss', 'sass']
let g:sass_compile_cssdir=['css', 'stylesheet']
let g:sass_compile_beforecmd=''
let g:sass_compile_aftercmd=''
let $PATH=$PATH."/usr/local/bin/compass"

"//////////////////////////////////////////////////

"--------------------------------------------------
" previm
"--------------------------------------------------

augroup PrevimSettings
	autocmd!
	autocmd BufNewFile,BufRead *. {md, mdwn, mkd, mkdn, mark*} set filetype=markdown
augroup end
let g:previm_open_cmd=''

"//////////////////////////////////////////////////

"//////////////////////////////////////////////////

"template

"==================================================
"
"==================================================


"--------------------------------------------------
"
"--------------------------------------------------


"//////////////////////////////////////////////////




