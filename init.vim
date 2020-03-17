"init.nvim にpython のpath を指定してneovim の起動速度を早くする
if has("win64")
    "環境依存のため要注意
    if expand('~\')=='C:\Users\naoki\'
        let g:pc_name='SurfacePro'
        let g:python_host_prog='C:\ProLang\Python\Python27\python.exe'
        let g:python3_host_prog='C:\ProLang\Python\Python37\python.exe'
    else
        let g:python_host_prog='D:\Programs\Python\Python27\python.exe'
        let g:python3_host_prog='D:\Programs\Python\Python37\python.exe'
    endif
elseif has("unix")
        let g:python3_host_prog = $PYENV_ROOT . '/versions/neovim/bin/python'
endif


if &compatible
  set nocompatible
endif
"--------------------------------------------------------------------------
"OSの判定
if has("win64")
    let g:ostype = "win"
    let s:vim_runtime_dir=expand('~\AppData\Local\nvim')
    let $NVIM_RPLUGIN_MANIFEST = '~\AppData\Local\nvim\rplugin.vim'
elseif has("win32")
    let g:ostype = "win_x86"
elseif has("unix")
    let g:ostype = "unix"
    let s:vim_runtime_dir = $XDG_CONFIG_HOME . '/nvim'
    let $NVIM_RPLUGIN_MANIFEST = s:vim_runtime_dir . '/rplugin.vim'
else
    let g:ostype = "unknown"
endif

"--------------------------------------------------------------------------
"vimの設定
set number          "行番号を表示する
set ruler
set title           "編集中のファイル名を表示
set showmatch       "括弧入力時の対応する括弧を表示
set matchtime=15    "上の表示までの時間を設定
syntax on           "コードの色分け
set t_Co=256
":colors... desert か elflord か ron
if g:ostype=="win"
    colorscheme desert
elseif g:ostype=="unix"
    colorscheme ron
else
    colorscheme default
endif
" コメントの色を黄色は3水色は6
"hi Comment ctermfg=3

set cursorline             "カーソル行の背景色を変える
" カーソルラインがONの時、行全体をハイライトする
hi CursorLine cterm=NONE ctermfg=Black ctermbg=Blue
"
" カーソルラインがONの時、行番号をハイライトする
hi CursorColumn cterm=NONE ctermbg=Blue ctermfg=black


set sidescroll=1            "左右スクロールは一文字づつ行う
set display=lastline        "一行の内容を行末の最後まで表示する
set virtualedit=onemore     "行末の1文字先までカーソルを移動できる
set expandtab               "Tabを押すと空白文字が入る
set colorcolumn=80          "80行目に印をつける
set list                    "空白文字の可視化
set listchars=tab:≫-,trail:-,extends:≫,precedes:≪,nbsp:% ",eol:?,
set whichwrap=b,s,h,l,[,],<,> "カーソルのまわりこみができるように

set tabstop=4               "インデントをスペース4つ分に設定
set shiftwidth=4            "自動生成されるtab幅をスペース4つ分に設定
"set smartindent            "自動でインデント
set formatoptions-=c
if g:ostype=="win"
    "windowsでコピペできるようにする。
    :source $VIMRUNTIME/mswin.vim
elseif g:ostype=="unix"
    set clipboard=unnamedplus
endif

set confirm         "保存されていないファイルがあるときは終了前に保存確認
set backup
let &backupdir = s:vim_runtime_dir . '/vim_backup'
set encoding=utf-8  "ファイル：vimの文字コード
set fileencodings=ucs-bom,utf-8,euc-jp,iso-2022-jp,cp932,utf-16,utf-16le
"set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8-
set fileformats=dos,unix,mac    "ファイル：ファイルフォーマット

set spelllang=en,cjk            "スペルチェック時に日本語を除外する


"####検索設定####?                                                            
set ignorecase      "大文字・小文字の区別なく検索する
set smartcase       "検索文字列に大文字が含まれている場合は区別して検索
set wrapscan        "検索時に最後まで行ったら最初に戻る
set hlsearch        "検索結果をハイライト表示

set wildmenu

"####keymaps####                                                              
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
"Yでカーソルから行末までヤンク
nnoremap Y y$
"xで消したとき無名レジスタに入れない
nnoremap x "_x
nnoremap X "_X


autocmd Filetype c setlocal ts=2 | set sw=2
autocmd Filetype cpp setlocal ts=2 | set sw=2

set splitright      "新しいウィンドウを右に開く

"---------------------------------------------------------------------------
""deinの設定
if g:ostype=="win"
    set runtimepath+=~/AppData/Local/nvim_dein/dein/repos/github.com/Shougo/dein.vim
    "dein.vimのディレクトリ
    let g:dein_dir = expand('~/AppData/Local/nvim_dein/dein')
elseif g:ostype=="unix"
    set runtimepath+=$XDG_CONFIG_HOME/nvim_dein/dein/repos/github.com/Shougo/dein.vim
    let g:dein_dir = $XDG_CONFIG_HOME . '/nvim_dein/dein'
endif

" dein.vim 本体
let s:dein_repo_dir = g:dein_dir . '/repos/github.com/Shougo/dein.vim'
"tomlファイルとその場所
let s:toml = s:vim_runtime_dir . '/dein.toml'
"tomlファイル(遅延読み込み)とその場所
let s:lazy_toml = s:vim_runtime_dir . '/deinlazy.toml'

" dein.vim がなければ git clone(うちで動くかはわからない)
if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
else
    "プラグイン読み込みとキャッシュ作成
    if dein#load_state(g:dein_dir)
        call dein#begin(g:dein_dir)

        call dein#add(g:dein_dir)
        call dein#add(s:dein_repo_dir)
        "tomlによるプラグインの読み込みと、遅延読み込み
        call dein#load_toml(s:toml, {'lazy' : 0})
        call dein#load_toml(s:lazy_toml, {'lazy' : 1})

        call dein#end()
        call dein#save_state()
    endif

    if dein#check_install()
        call dein#install()
    endif
endif


filetype plugin indent on
syntax enable
