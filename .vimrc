"-------------------------------------------------------------------------------
set nocompatible       " vimですよ

"-------------------------------------------------------------------------------
" Source

" Ctrl+c, Ctrl+vを使う
" gvimでCtrl-VやCtrl-Cを使う方法 - Chiseiのはてなダイアリー
" http://d.hatena.ne.jp/Chisei/20090517/1242489849
source $VIMRUNTIME/mswin.vim


"-------------------------------------------------------------------------------
" ステータスライン
set laststatus=2 " 常にステータスラインを表示
set statusline=%<%F\ %r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v(ASCII=%03.3b,HEX=%02.2B)\ %l/%L(%P)%m


"-------------------------------------------------------------------------------
" 基本設定
let mapleader = ","            " キーマップリーダー
set scrolloff=5                " スクロール時の余白確保
"set textwidth=0                " 一行に長い文章を書いていても自動折り返しをしない
"set nobackup                   " バックアップ取らない
set backupdir=D:\temp
set autoread                   " 他で書き換えられたら自動で読み直す
"set noswapfile                 " スワップファイル作らない
set hidden                     " 編集中でも他のファイルを開けるようにする
set backspace=indent,eol,start " バックスペースでなんでも消せるように
set formatoptions=lmoq         " テキスト整形オプション，マルチバイト系を追加
set vb t_vb=                   " ビープをならさない
set browsedir=buffer           " Exploreの初期ディレクトリ
set whichwrap=b,s,h,l,<,>,[,]  " カーソルを行頭、行末で止まらないようにする
set showcmd                    " コマンドをステータス行に表示
" set editor 

"filetype indent off            " ファイルタイプによるインデント
"filetype plugin off            " ファイルタイプごとのプラグイン

" guioptions
set guioptions=mr

" fullscreen
"-----------------------------------------------------------
" gVimで全画面トグル(タスクバー/キャプション含) @ 7bit
" http://nanabit.net/blog/2007/11/01/vim-fullscreen/
nnoremap <F11> :call ToggleFullScreen()<CR>
function! ToggleFullScreen()
  if &guioptions =~# 'C'
    set guioptions-=C
    if exists('s:go_temp')
      if s:go_temp =~# 'm'
        set guioptions+=m
      endif
      if s:go_temp =~# 'T'
        set guioptions+=T
      endif
    endif
    simalt ~r
  else
    let s:go_temp = &guioptions
    set guioptions+=C
    set guioptions-=m
    set guioptions-=T
    simalt ~x
  endif
endfunction

"-------------------------------------------------------------------------------
" 表示
set showmatch         " 括弧の対応をハイライト
set showcmd           " 入力中のコマンドを表示
set number            " 行番号表示
set list              " 不可視文字表示
set listchars=tab:>.,trail:_,extends:>,precedes:<" 不可視文字の表示形式
"set display=uhex      " 印字不可能文字を16進数で表示

" 全角スペースをハイライト
"if has("syntax")
"    syntax on
"    function! ActivateInvisibleIndicator()
"        syntax match InvisibleJISX0208Space "　" display containedin=ALL
"        highlight InvisibleJISX0208Space term=underline ctermbg=Cyan guibg=Cyan

"        syntax match InvisibleTrailedSpace "[ \t]\+$" display containedin=ALL
"        highlight InvisibleTrailedSpace term=underline ctermbg=Red guibg=Red
"        syntax match InvisibleTab "\t" display containedin=ALL
"        highlight InvisibleTab term=underline ctermbg=Cyan guibg=Cyan
"    endf
"    augroup invisible
"        autocmd! invisible
"        autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
"    augroup END
"endif

" カレントウィンドウにのみ罫線を引く
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

" ウインドウを最大化して起動
au GUIEnter * simalt ~x
 
 
"-------------------------------------------------------------------------------
" インデント
set autoindent
set smartindent
set cindent
" softtabstopはTabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
set tabstop=4 shiftwidth=4 softtabstop=0
set noexpandtab " タブをスペースに展開しない
 
 
"-------------------------------------------------------------------------------
" 補完・履歴
set wildmenu           " コマンド補完を強化
set wildchar=<tab>     " コマンド補完を開始するキー
set wildmode=list:full " リスト表示，最長マッチ
set history=1000       " コマンド・検索パターンの履歴数
set complete+=k        " 補完に辞書ファイル追加
 
 
"-------------------------------------------------------------------------------
" 検索設定
set wrapscan   " 最後まで検索したら先頭へ戻る
set ignorecase " 大文字小文字無視
set smartcase  " 大文字ではじめたら大文字小文字無視しない
set incsearch  " インクリメンタルサーチ
set hlsearch   " 検索文字をハイライト
 
"選択した文字列を検索
vnoremap <silent> // y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
"選択した文字列を置換
vnoremap /r "xy:%s/<C-R>=escape(@x, '\\/.*$^~[]')<CR>//gc<Left><Left><Left>
 
 
"-------------------------------------------------------------------------------
" エンコーディング関連
  
" 改行文字
"set ffs=unix,dos,mac
 
" デフォルトエンコーディング
"set   encoding=utf-8
"
"if has('win32') && has('kaoriya')
"  set   ambiwidth=auto
"else
"  set   ambiwidth=double
"endif
 
"if has('iconv')
"  let s:enc_euc = 'euc-jp'
"  let s:enc_jis = 'iso-2022-jp'
 
"  if iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
"    let s:enc_euc = 'euc-jisx0213,euc-jp'
"    let s:enc_jis = 'iso-2022-jp-3'
"  endif
 
"  set   fileencodings&
"  let &fileencodings = &fileencodings.','.s:enc_jis.',cp932,'.s:enc_euc
  
"  unlet s:enc_euc
"  unlet s:enc_jis
"endif
  
"if has('win32unix')
"  set   termencoding=cp932
"elseif !has('macunix')
"  set   termencoding=euc-jp
"endif
 
 
"-------------------------------------------------------------------------------
" キーバインド関係
 
" 行単位で移動(1行が長い場合に便利)
nnoremap j gj
nnoremap k gk
 
" バッファ周り
nmap <silent> <C-l> :bnext<CR>
nmap <silent> <C-h> :bprevious<CR>
nmap <silent> ,l    :BufExplorer<CR>

" 検索などで飛んだらそこを真ん中に
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz
nmap G Gzz

"usキーボードで使いやすく
nmap ; :

" 文字数カウント
" set statusline=%{b:charCounterCount}

" Tue Apr 22 07:49:35 JST 2008
"
" b:charCounterCount に文字数をセットするスクリプト
" バッファを保存したりしたときに、更新される。
"
" ステータスラインに入れて使う例↓
" set statusline=%{b:charCounterCount}

if exists("anekos_charCounter")
	finish
endif
let anekos_charCounter=1

augroup CharCounter
	autocmd!
	autocmd BufCreate,BufEnter * call <SID>Initialize()
	autocmd BufUnload,FileWritePre,BufWritePre * call <SID>Update()
augroup END

function! s:Initialize()
	if exists('b:charCounterCount')
	else
		return s:Update()
	endif
endfunction

function! s:Update()
	let b:charCounterCount = s:CharCount()
endfunction

function! s:CharCount()
	let l:result = 0
	for l:linenum in range(0, line('$'))
		let l:line = getline(l:linenum)
		let l:result += strlen(substitute(l:line, ".", "x", "g"))
	endfor
	return l:result
endfunction

function! AnekoS_CharCounter_CharCount()
	return s:CharCount()
endfunction

" HoN用設定
nmap ,se :set expandtab<CR>
nmap ,sn :set noexpandtab<CR>

"-------------------------------------------------------------------------------
" プラグインごとの設定

" autocomplpop.vim
inoremap <silent> <expr> ,t
      \ (exists('#AutoComplPopGlobalAutoCommand#InsertEnter#*')) ? "\<C-o>:AutoComplPopDisable\<CR>" : "\<C-o>:AutoComplPopEnable\<CR>"

" bufftabs.vim
" Vimバッファリストの決定版？ buftabs.vim - ナレッジエース http://blog.blueblack.net/item_211
"バッファタブにパスを省略してファイル名のみ表示する(buftabs.vim)
let g:buftabs_only_basename=1
"バッファタブをステータスライン内に表示する
let g:buftabs_in_statusline=1


" ChangeLog
let g:changelog_timeformat = "%Y-%m-%d %H:%M"
let g:changelog_username = "toyoh"


" Dot.vim
" wifky! - FrontPage http://chimachima-site.hp.infoseek.co.jp/c/h/i/chimachima-site/cgi-bin/wifky.cgi?p=FrontPage
" let g:DOT_headingMark = '*'


" FuzzyFinder
" nnoremap <unique> <silent> <C-S> :FufBuffer!<CR>
nnoremap <unique> <silent> ef :FufFile!<CR>
nnoremap <silent> eff :FufFile!<CR>
nnoremap <silent> efm :FufMruFile!<CR>
autocmd FileType fuf nmap <C-c> <ESC>
let g:fuf_patternSeparator = ' '
let g:fuf_modesDisable = ['mrucmd']
let g:fuf_mrufile_exclude = '\v\~$|\.bak$|\.swp|\.howm$'
let g:fuf_mrufile_maxItem = 2000
let g:fuf_enumeratingLimit = 20


" migemo.vim
if has('migemo')
  set migemo
  set migemodict=D:\home\vimfiles\dict\migemo-dict
endif


" mru.vim
let MRU_Max_Entries=50


" QuickBuf.vim
let g:qb_hotkey="<space><space>"


" YankRing.vim
nmap ,y :YRShow<CR>


" QFixapp
let mygrepprg                      = 'c:\Gnu32\bin\grep'
let MyGrep_DamemojiReplaceReg      = '.'
" let MyGrep_ShellEncoding           = 'utf-8'

"vimで開く拡張子の正規表現
let QFixHowm_OpenVimExtReg  = '\.txt$\|\.howm$\|\.vim$'

"リンクを開くブラウザの指定
if has('win32')
  "Internet explorer
  "let QFixHowm_OpenURIcmd = '!start "C:/Program Files/Internet Explorer/iexplore.exe" %s'
  "firefox
  let QFixHowm_OpenURIcmd  = '!start "C:/Program Files/Mozilla Firefox/firefox.exe" %s'
elseif has('unix')
  let QFixHowm_OpenURIcmd = "call system('firefox %s &')"
endif


" QFixGrep.vim
" qFixhowm.vim
set runtimepath+=d:\home\vimfiles\plugin\qfixapp
let QFixHowm_Key                   = ','
let howm_dir                       = 'd:\doc\My Dropbox\log\howm'
let howm_filename                  = '%Y/%m/%Y-%m-%d-%H%M%S.howm'
let howm_keywordfile               = 'd:\doc\My Dropbox\log\howm\howmkey'
let howm_fileencoding              = 'cp932'
let howm_fileformat                = 'dos'
let QFixHowm_FoldingPattern        = '^[*[]'
"let QFixHowm_FoldingPattern        = '^\s\{-}\*\{1}'
let QFixHowm_ForceEncoding         = 0
let QFixHowm_RecentDays            = 10
let QFixHowm_SaveTime              = 2
let QFixHowm_RecentMode            = 2
let QFixHowm_Replace_Title_Pattern = '^=\s*\(\[[:a-zA-Z0-9 ]*\]\s*\)\=$'
let QFixHowm_Replace_Title_Len     = 64
let QFixHowm_MruFile               = 'd:\log\howm\howm-mru'
let QFixHowm_MruFileMax            = 50
let QFixHowm_ShowTodoOnMenu        = 1
let QFixHowm_ShowSchedule          = 10
let QFixHowm_ShowScheduleTodo      = 10
let QFix_CloseOnJump               = 1
let QFix_Height                    = 25
let QFix_SearchPathEnable          = 1
" let QFix_SearchPath                = '~/Documents/howm-vim/'
"if has('mac')
"  let MyOpenURI_cmd = "call system('/usr/bin/browser %s &')"
"endif

" QfixHowm Calendar
" calendar.vimとQFixHowmで日記を書く - こくう http://d.hatena.ne.jp/fuenor/20090721/1248170176
let calendar_action = "QFixHowmCalendarDiary"
let calendar_sign   = "QFixHowmCalendarSign"
"日記ファイル名
let QFixHowm_DiaryFile = '%Y/%m/%Y-%m-%d-000000.txt'


"howmのファイルタイプ
let QFixHowm_FileType = 'txt'

"howmファイルの拡張子をtxtにする
let howm_filename = '%Y/%m/%Y-%m-%d-%H%M%S.txt'

"ペアリンクファイルの保存場所
let QFixHowm_PairLinkDir = 'pairlink'


" タグ付きで新規メモを作成
nnoremap <silent> ,,ht :call QFixHowmCreateNewFileWithTag('[ ]')<CR>
let QFixHowm_UserSwActionLock = ['[ ]', '[HoN]', '[Vim]', '[Firefox]']

" howm2html.vim
" HTMLファイル出力先
let HowmHtml_htmldir = 'D:/log/howm/howm2html'
let HowmHtml_basedir = ''
"howm://(publish 指定時)
let g:howm_publish_dir = g:howm_dir
"rel://
let g:QFixHowm_RelPath = g:howm_dir
"rel://(publish 指定時)
let g:HowmHtml_publish_RelPath = g:QFixHowm_RelPath

"htmlファイルのエンコーディング(utf-8, Shift_JIS, euc-jp)
let HowmHtml_encoding = 'utf-8'

"タイトル記号
let QFixHowm_Title = '='
"アンカー記号
let HowmHtml_Bullet = '■'

" 使用ブラウザ
if has('unix')
  let HowmHtml_OpenURIcmd = "call system('firefox %s &')"
else
  let HowmHtml_OpenURIcmd = '!start "C:/Program Files/Internet Explorer/iexplore.exe" %s'
endif

"HTMLに適用されるCSSファイル名
let HowmHtml_cssname = 'vicuna.css'
"vicunaスキンを使用する。
"空文字列以外を指定するとcssファイル名は vicuna.cssに設定される。
" single, double, multi 等vicunaスキンで使用可能な属性を指定する。
let HowmHtml_Vicuna = ''

"サイトの設定
"===
" 2カラムに設定
let HowmHtml_Vicuna = 'double'
" 表示するサイト名
let HowmHtml_SightName = 'Howm2html'
" ナビゲーション
let g:HowmHtml_Navi = [
  \ '<dt>Archives</dt><dd><ul>',
  \ '<li><a href="./dummy.html" title="ダミーです" rel="nofollow">2010-01</a></li>',
  \ '</ul></dd>'
\]



" vcscommand.vim
set runtimepath+=~/.vim/plugin/vcscommand


" zen-coding.vim
" let g:user_zen_expandabbr_key = '<c-e>'


"-------------------------------------------------------------------------------
" ユーティリティ

" 現在開いているファイルのある場所に常にcdする
au   BufEnter *      exec ":lcd " . expand("%:p:h")

"hon
autocmd BufEnter 2010-03-13-030023.howm so D:\home\vimfiles\plugin\qfixapp\syntax\howm_hon.vim
autocmd BufEnter 2010-03-13-030023.howm set expandtab
