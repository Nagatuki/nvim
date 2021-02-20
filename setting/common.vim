"neovimの共通設定

"変数と環境変数
let g:vim_runtime_dir = $XDG_CONFIG_HOME . '/nvim'
let $NVIM_RPLUGIN_MANIFEST = g:vim_runtime_dir . '/rplugin.vim'

if &compatible
  set nocompatible
endif

"vimの設定
set number                      "行番号を表示する
set ruler                       "カーソル位置の表示
set title                       "編集中のファイル名を表示
set showmatch                   "括弧入力時の対応する括弧を表示
set matchtime=15                "上の表示までの時間を設定
set cursorline                  "カーソル行の背景色を変える
set sidescroll=1                "左右スクロールは一文字づつ行う
set display=lastline            "一行の内容を行末の最後まで表示する
set virtualedit=onemore         "行末の1文字先までカーソルを移動できる
set expandtab                   "Tabを押すと空白文字が入る
set colorcolumn=80              "80行目に印をつける
set list                        "空白文字の可視化
set listchars=tab:≫-,trail:-,extends:≫,precedes:≪,nbsp:% ",eol:?,
set whichwrap=b,s,h,l,[,],<,>   "カーソルのまわりこみができるように
set tabstop=4                   "インデントをスペース4つ分に設定
set shiftwidth=4                "自動生成されるtab幅をスペース4つ分に設定
set formatoptions-=c
set wildmenu        "コマンドモードの補完

syntax on           "コードの色分け
set t_Co=256

" コメントの色を黄色は3水色は6
"hi Comment ctermfg=3

" カーソルラインがONの時、行全体をハイライトする
hi CursorLine cterm=NONE ctermfg=Black ctermbg=Blue

" カーソルラインがONの時、行番号をハイライトする
hi CursorColumn cterm=NONE ctermbg=Blue ctermfg=black

set confirm         "保存されていないファイルがあるときは終了前に保存確認
set backup

let &backupdir = g:vim_runtime_dir . '/vim_backup'

set encoding=utf-8              "バッファ内で扱う文字コード
set fileencoding=utf-8          " 書き込み時UTF-8出力

"読み込む文字コード
set fileencodings=utf-8,cp932,ucs-bom,euc-jp,iso-2022-jp,utf-16,utf-16le
"set fileencodings=ucs-bom,utf-8,euc-jp,iso-2022-jp,cp932,utf-16,utf-16le

set spelllang=en,cjk            "スペルチェック時に日本語を除外する

"検索設定
set ignorecase      "大文字・小文字の区別なく検索する
set smartcase       "検索文字列に大文字が含まれている場合は区別して検索
set wrapscan        "検索時に最後まで行ったら最初に戻る
set hlsearch        "検索結果をハイライト表示

"keymaps                                                              
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

set splitbelow      "新しいウィンドウを下に開く
set splitright      "新しいウィンドウを右に開く