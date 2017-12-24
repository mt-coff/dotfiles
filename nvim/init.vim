"==================================================
" general
"==================================================

" 文字コード
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
" インデント
set expandtab
set tabstop=2
set shiftwidth=2
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
" スワップファイル非作成
set noswapfile
" バックアップファイル非作成
set nobackup
" クリップボード系
set clipboard=unnamed,unnamedplus
" ファイルの保存をせずに他のファイルを開けるようにする
set hidden
" 不可視文字の可視化
set list
" 不可視文字の書式設定
set listchars=tab:\|\ ,trail:_,eol:$,extends:>,precedes:<,nbsp:%
" 補完時はポップアップのみ設定
set completeopt=menuone
" ftplugin
filetype plugin indent on
" plugin.vim をロード
source $HOME/.config/nvim/plugin.vim

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
