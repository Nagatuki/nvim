"deinの設定

"runtimepathの追加
let &runtimepath = &runtimepath . ',' . g:vim_runtime_dir . '/dein/repos/github.com/Shougo/dein.vim'

"dein.vimのディレクトリ
let g:dein_dir = g:vim_runtime_dir . '/dein'

" dein.vim 本体
let s:dein_repo_dir = g:dein_dir . '/repos/github.com/Shougo/dein.vim'

"tomlファイルの場所
let s:toml = g:vim_runtime_dir . '/dein.toml'

"lazy_tomlファイルの場所
let s:lazy_toml = g:vim_runtime_dir . '/deinlazy.toml'

" dein.vim がなければ git clone
if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif

"プラグイン読み込みとキャッシュ作成
if dein#load_state(g:dein_dir)
    call dein#begin(g:dein_dir)

    call dein#add(g:dein_dir)
    call dein#add(s:dein_repo_dir)

    call dein#load_toml(s:toml, {'lazy' : 0})
    call dein#load_toml(s:lazy_toml, {'lazy' : 1})

    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif