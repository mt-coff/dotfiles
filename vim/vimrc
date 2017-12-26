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
	if has("lua")
		Plug 'Shougo/neocomplete'
	else
		Plug 'Shougo/neocomplcache'
	endif
 	Plug 'Shougo/neosnippet'
 	Plug 'Shougo/neosnippet-snippets'
	Plug 'honza/vim-snippets'
	Plug 'w0rp/ale'
	Plug 'fatih/vim-go', {'for': 'go'}
	Plug 'editorconfig/editorconfig-vim'
	Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
	Plug 'mattn/emmet-vim', {'for': ['html', 'php', 'css', 'markdown', 'vue']}
	Plug 'posva/vim-vue', {'for': 'vue'}
	Plug 'othree/yajs.vim', {'for': 'javascript'}
	Plug 'ternjs/tern_for_vim', {'for': ['javascript', 'vue'], 'do': 'npm install -g'}
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'jacoborus/tender.vim'
	Plug 'darthmall/vim-vue', {'for': 'vue' }
	Plug 'elmcast/elm-vim', {'for': 'elm'}
	Plug 'cohama/lexima.vim'
	Plug 'thinca/vim-quickrun'
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
" マウスの有効化
set mouse=a
set ttymouse=xterm2
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
	hi SpecialKey ctermbg=none ctermfg=DarkGreen
	hi NonText ctermbg=none ctermfg=DarkGreen
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

"--------------------------------------------------
" Lexima
"--------------------------------------------------

	let g:lexima_enable_basic_rules = 1

"//////////////////////////////////////////////////

"--------------------------------------------------
" completion & snippets
"--------------------------------------------------

if has("lua")

	let g:acp_enableAtStartup = 0
	" Use neocomplete.
	let g:neocomplete#enable_at_startup = 1
	" Use smartcase.
	let g:neocomplete#enable_smart_case = 1
	" Set minimum syntax keyword length.
	let g:neocomplete#sources#syntax#min_keyword_length = 1

	" Define dictionary.
	let g:neocomplete#sources#dictionary#dictionaries = {
		\ 'default' : '',
		\ }

	" Define keyword.
	if !exists('g:neocomplete#keyword_patterns')
		let g:neocomplete#keyword_patterns = {}
	endif
	let g:neocomplete#keyword_patterns['default'] = '\h\w*'

	" Plugin key-mappings.
	inoremap <expr><C-g>     neocomplete#undo_completion()
	inoremap <expr><C-l>     neocomplete#complete_common_string()

	" Recommended key-mappings.
	" <CR>: close popup and save indent.
	inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
	function! s:my_cr_function()
	  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
	  " For no inserting <CR> key.
	  "return pumvisible() ? "\<C-y>" : "\<CR>"
	endfunction
	" <TAB>: completion.
	inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
	" <C-h>, <BS>: close popup and delete backword char.
	inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
	inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

else

	" Disable AutoComplPop.
	let g:acp_enableAtStartup = 0
	" Use neocomplcache.
	let g:neocomplcache_enable_at_startup = 1
	" Use smartcase.
	let g:neocomplcache_enable_smart_case = 1
	" Set minimum syntax keyword length.
	let g:neocomplcache_min_syntax_length = 1
	let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

	" Define dictionary.
	let g:neocomplcache_dictionary_filetype_lists = {
		\ 'default' : ''
		\ }

	" Plugin key-mappings.
	inoremap <expr><C-g>     neocomplcache#undo_completion()
	inoremap <expr><C-l>     neocomplcache#complete_common_string()

	" Recommended key-mappings.
	" <CR>: close popup and save indent.
	inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
	function! s:my_cr_function()
	  return neocomplcache#smart_close_popup() . "\<CR>"
	endfunction
	" <TAB>: completion.
	inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
	" <C-h>, <BS>: close popup and delete backword char.
	inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
	inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
	inoremap <expr><C-y>  neocomplcache#close_popup()
	inoremap <expr><C-e>  neocomplcache#cancel_popup()

endif

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

"//////////////////////////////////////////////////
