"-------------------------------------------------------------------------------
set nocompatible       " vim�ł���

"-------------------------------------------------------------------------------
" Source

" Ctrl+c, Ctrl+v���g��
" gvim��Ctrl-V��Ctrl-C���g�����@ - Chisei�̂͂Ăȃ_�C�A���[
" http://d.hatena.ne.jp/Chisei/20090517/1242489849
source $VIMRUNTIME/mswin.vim


"-------------------------------------------------------------------------------
" �X�e�[�^�X���C��
set laststatus=2 " ��ɃX�e�[�^�X���C����\��
set statusline=%<%F\ %r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v(ASCII=%03.3b,HEX=%02.2B)\ %l/%L(%P)%m


"-------------------------------------------------------------------------------
" ��{�ݒ�
let mapleader = ","            " �L�[�}�b�v���[�_�[
set scrolloff=5                " �X�N���[�����̗]���m��
"set textwidth=0                " ��s�ɒ������͂������Ă��Ă������܂�Ԃ������Ȃ�
"set nobackup                   " �o�b�N�A�b�v���Ȃ�
set backupdir=D:\temp
set autoread                   " ���ŏ���������ꂽ�玩���œǂݒ���
"set noswapfile                 " �X���b�v�t�@�C�����Ȃ�
set hidden                     " �ҏW���ł����̃t�@�C�����J����悤�ɂ���
set backspace=indent,eol,start " �o�b�N�X�y�[�X�łȂ�ł�������悤��
set formatoptions=lmoq         " �e�L�X�g���`�I�v�V�����C�}���`�o�C�g�n��ǉ�
set vb t_vb=                   " �r�[�v���Ȃ炳�Ȃ�
set browsedir=buffer           " Explore�̏����f�B���N�g��
set whichwrap=b,s,h,l,<,>,[,]  " �J�[�\�����s���A�s���Ŏ~�܂�Ȃ��悤�ɂ���
set showcmd                    " �R�}���h���X�e�[�^�X�s�ɕ\��
" set editor 

"filetype indent off            " �t�@�C���^�C�v�ɂ��C���f���g
"filetype plugin off            " �t�@�C���^�C�v���Ƃ̃v���O�C��

" guioptions
set guioptions=mr

" fullscreen
"-----------------------------------------------------------
" gVim�őS��ʃg�O��(�^�X�N�o�[/�L���v�V������) @ 7bit
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
" �\��
set showmatch         " ���ʂ̑Ή����n�C���C�g
set showcmd           " ���͒��̃R�}���h��\��
set number            " �s�ԍ��\��
set list              " �s�������\��
set listchars=tab:>.,trail:_,extends:>,precedes:<" �s�������̕\���`��
"set display=uhex      " �󎚕s�\������16�i���ŕ\��

" �S�p�X�y�[�X���n�C���C�g
"if has("syntax")
"    syntax on
"    function! ActivateInvisibleIndicator()
"        syntax match InvisibleJISX0208Space "�@" display containedin=ALL
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

" �J�����g�E�B���h�E�ɂ̂݌r��������
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

" �E�C���h�E���ő剻���ċN��
au GUIEnter * simalt ~x
 
 
"-------------------------------------------------------------------------------
" �C���f���g
set autoindent
set smartindent
set cindent
" softtabstop��Tab�L�[�����������̑}�������󔒂̗ʁC0�̏ꍇ��tabstop�Ɠ����CBS�ɂ��e������
set tabstop=4 shiftwidth=4 softtabstop=0
set noexpandtab " �^�u���X�y�[�X�ɓW�J���Ȃ�
 
 
"-------------------------------------------------------------------------------
" �⊮�E����
set wildmenu           " �R�}���h�⊮������
set wildchar=<tab>     " �R�}���h�⊮���J�n����L�[
set wildmode=list:full " ���X�g�\���C�Œ��}�b�`
set history=1000       " �R�}���h�E�����p�^�[���̗���
set complete+=k        " �⊮�Ɏ����t�@�C���ǉ�
 
 
"-------------------------------------------------------------------------------
" �����ݒ�
set wrapscan   " �Ō�܂Ō���������擪�֖߂�
set ignorecase " �啶������������
set smartcase  " �啶���ł͂��߂���啶���������������Ȃ�
set incsearch  " �C���N�������^���T�[�`
set hlsearch   " �����������n�C���C�g
 
"�I�����������������
vnoremap <silent> // y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
"�I�������������u��
vnoremap /r "xy:%s/<C-R>=escape(@x, '\\/.*$^~[]')<CR>//gc<Left><Left><Left>
 
 
"-------------------------------------------------------------------------------
" �G���R�[�f�B���O�֘A
  
" ���s����
"set ffs=unix,dos,mac
 
" �f�t�H���g�G���R�[�f�B���O
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
" �L�[�o�C���h�֌W
 
" �s�P�ʂňړ�(1�s�������ꍇ�ɕ֗�)
nnoremap j gj
nnoremap k gk
 
" �o�b�t�@����
nmap <silent> <C-l> :bnext<CR>
nmap <silent> <C-h> :bprevious<CR>
nmap <silent> ,l    :BufExplorer<CR>

" �����ȂǂŔ�񂾂炻����^�񒆂�
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz
nmap G Gzz

"us�L�[�{�[�h�Ŏg���₷��
nmap ; :

" �������J�E���g
" set statusline=%{b:charCounterCount}

" Tue Apr 22 07:49:35 JST 2008
"
" b:charCounterCount �ɕ��������Z�b�g����X�N���v�g
" �o�b�t�@��ۑ������肵���Ƃ��ɁA�X�V�����B
"
" �X�e�[�^�X���C���ɓ���Ďg���ၫ
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

" HoN�p�ݒ�
nmap ,se :set expandtab<CR>
nmap ,sn :set noexpandtab<CR>

"-------------------------------------------------------------------------------
" �v���O�C�����Ƃ̐ݒ�

" autocomplpop.vim
inoremap <silent> <expr> ,t
      \ (exists('#AutoComplPopGlobalAutoCommand#InsertEnter#*')) ? "\<C-o>:AutoComplPopDisable\<CR>" : "\<C-o>:AutoComplPopEnable\<CR>"

" bufftabs.vim
" Vim�o�b�t�@���X�g�̌���ŁH buftabs.vim - �i���b�W�G�[�X http://blog.blueblack.net/item_211
"�o�b�t�@�^�u�Ƀp�X���ȗ����ăt�@�C�����̂ݕ\������(buftabs.vim)
let g:buftabs_only_basename=1
"�o�b�t�@�^�u���X�e�[�^�X���C�����ɕ\������
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

"vim�ŊJ���g���q�̐��K�\��
let QFixHowm_OpenVimExtReg  = '\.txt$\|\.howm$\|\.vim$'

"�����N���J���u���E�U�̎w��
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
" calendar.vim��QFixHowm�œ��L������ - ������ http://d.hatena.ne.jp/fuenor/20090721/1248170176
let calendar_action = "QFixHowmCalendarDiary"
let calendar_sign   = "QFixHowmCalendarSign"
"���L�t�@�C����
let QFixHowm_DiaryFile = '%Y/%m/%Y-%m-%d-000000.txt'


"howm�̃t�@�C���^�C�v
let QFixHowm_FileType = 'txt'

"howm�t�@�C���̊g���q��txt�ɂ���
let howm_filename = '%Y/%m/%Y-%m-%d-%H%M%S.txt'

"�y�A�����N�t�@�C���̕ۑ��ꏊ
let QFixHowm_PairLinkDir = 'pairlink'


" �^�O�t���ŐV�K�������쐬
nnoremap <silent> ,,ht :call QFixHowmCreateNewFileWithTag('[ ]')<CR>
let QFixHowm_UserSwActionLock = ['[ ]', '[HoN]', '[Vim]', '[Firefox]']

" howm2html.vim
" HTML�t�@�C���o�͐�
let HowmHtml_htmldir = 'D:/log/howm/howm2html'
let HowmHtml_basedir = ''
"howm://(publish �w�莞)
let g:howm_publish_dir = g:howm_dir
"rel://
let g:QFixHowm_RelPath = g:howm_dir
"rel://(publish �w�莞)
let g:HowmHtml_publish_RelPath = g:QFixHowm_RelPath

"html�t�@�C���̃G���R�[�f�B���O(utf-8, Shift_JIS, euc-jp)
let HowmHtml_encoding = 'utf-8'

"�^�C�g���L��
let QFixHowm_Title = '='
"�A���J�[�L��
let HowmHtml_Bullet = '��'

" �g�p�u���E�U
if has('unix')
  let HowmHtml_OpenURIcmd = "call system('firefox %s &')"
else
  let HowmHtml_OpenURIcmd = '!start "C:/Program Files/Internet Explorer/iexplore.exe" %s'
endif

"HTML�ɓK�p�����CSS�t�@�C����
let HowmHtml_cssname = 'vicuna.css'
"vicuna�X�L�����g�p����B
"�󕶎���ȊO���w�肷���css�t�@�C������ vicuna.css�ɐݒ肳���B
" single, double, multi ��vicuna�X�L���Ŏg�p�\�ȑ������w�肷��B
let HowmHtml_Vicuna = ''

"�T�C�g�̐ݒ�
"===
" 2�J�����ɐݒ�
let HowmHtml_Vicuna = 'double'
" �\������T�C�g��
let HowmHtml_SightName = 'Howm2html'
" �i�r�Q�[�V����
let g:HowmHtml_Navi = [
  \ '<dt>Archives</dt><dd><ul>',
  \ '<li><a href="./dummy.html" title="�_�~�[�ł�" rel="nofollow">2010-01</a></li>',
  \ '</ul></dd>'
\]



" vcscommand.vim
set runtimepath+=~/.vim/plugin/vcscommand


" zen-coding.vim
" let g:user_zen_expandabbr_key = '<c-e>'


"-------------------------------------------------------------------------------
" ���[�e�B���e�B

" ���݊J���Ă���t�@�C���̂���ꏊ�ɏ��cd����
au   BufEnter *      exec ":lcd " . expand("%:p:h")

"hon
autocmd BufEnter 2010-03-13-030023.howm so D:\home\vimfiles\plugin\qfixapp\syntax\howm_hon.vim
autocmd BufEnter 2010-03-13-030023.howm set expandtab
