"環境変数XDG_CONFIG_HOMEの設定(sourceが変数を展開しないため)
if !exists("$XDG_CONFIG_HOME")
    if has("win64")
        let $XDG_CONFIG_HOME = $LOCALAPPDATA
    elseif has("win32")
        let $XDG_CONFIG_HOME = $LOCALAPPDATA
    elseif has("unix")
        let $XDG_CONFIG_HOME = ~/.config
    else
        let $XDG_CONFIG_HOME = ~/.config
    endif
endif

"共通処理
source $XDG_CONFIG_HOME/nvim/setting/common.vim

"OS依存処理
if has("win64")
    source $XDG_CONFIG_HOME/nvim/setting/windows.vim
elseif has("unix")
    source $XDG_CONFIG_HOME/nvim/setting/unix.vim
else
    let g:ostype = "unknown"
endif

"deinの処理
source $XDG_CONFIG_HOME/nvim/setting/dein.vim

filetype plugin indent on
syntax enable
