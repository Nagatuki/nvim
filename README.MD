# NeoVim Setting

## GitGutter
### コマンド
- toggle with `:GitGutterToggle`
- turn on with `:GitGutterEnable`
- turn off with `:GitGutterDisable`

## tcomment_vim
### キーバインド

| Mode | Key Bind | Result |
| :----: | :----: | :----: |
| normal | gcc | コメントアウト |
| visual | gc | コメントアウト |
| visual | Ctrl + / | コメントアウト |

## nerdtree
### コマンド
- toggle with `:NERDTreeToggle`

### キーバインド
| Mode | Key Bind | Result |
| :----: | :----: | :----: |
| normal | Ctrl + e | 起動 |
| | o | ファイルを開く |
| | enter | ファイルを開く |
| | t | タブで開く |
| | T | タブで開き移動しない|
| | i | 水平分割して開く |
| | gi | 水平分割して開き移動しない |
| | s | 垂直分割して開く |
| | gs | 垂直分割して開き移動しない |
| | O | 再帰的にディレクトリを全て開く |
| | x | 親ディレクトリを閉じる |
| | X | 再帰的にすべての子ディレクトリを閉じる |
| | m | メニューを表示する |
| | I | 隠しファイルの表示、非表示 |
| | F | ファイルの表示・非表示 |

## winresizer
### キーバインド
| Mode | Key Bind | Result |
| :----: | :----: | :----: |
| normal | Ctrl + e | リサイズ開始 |
| | enter | 確定 |

## coc.nvim
### コマンド
- インストールした拡張機能の実行 `:CocCommand`
- Language Server の設定 `:CocConfig`
- フォーマット `:Format`

### キーバインド
| Mode | Key Bind | Result |
| :----: | :----: | :----: |
| normal | gd | 定義へ移動 |
| normal | gi | 型定義へ移動 |
| normal | gy | 実装へ移動 |
| normal | gr | 参照先へ移動 |
| normal | Ctrl + o | ジャンプもとへ戻る |
| normal | K | ドキュメントを表示 |
| normal | Leader rn | 単語のリネーム |
| normal | [c | 1つ前の診断結果へ |
| normal | ]c | 1つ後の診断結果へ |
| normal | Space + a | 全ての診断結果を表示 |
| normal | Space + o | 全てのシンボルを表示 |



## Reference
### GitGutter
- https://github.com/airblade/vim-gitgutter
### tcomment_vim
- https://github.com/tomtom/
- https://www.karakaram.com/tcomment/#howtouse
- https://sy-base.com/myrobotics/vim/vim-tcomment_vim/gc
### NERDTree
- https://qiita.com/zwirky/items/0209579a635b4f9c95ee
### coc.nvim
- https://kashewnuts.github.io/2020/04/08/igrated_lsp_client_to_coc_nvim.html
- https://qiita.com/jiroshin/items/ee86ea426a51fa24b319#9-fzf%E3%81%A7%E9%AB%98%E9%80%9F%E3%81%AA%E5%8D%98%E8%AA%9E%E6%A4%9C%E7%B4%A2%E3%81%A8%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E6%A4%9C%E7%B4%A2%E3%82%92%E5%AE%9F%E7%8F%BE%E3%81%97%E3%82%88%E3%81%86-mag
- 