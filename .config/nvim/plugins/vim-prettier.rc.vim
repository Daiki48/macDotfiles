" @formatアノテーションを持ったファイルの自動フォーマットを無効にする
let g:prettier#autoformat = 0

" Prettierのパースエラーをquickfixに表示しない
let g:prettier#quickfix_enabled = 0

autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.vue,*.css,*.scss,*.json,*.md PrettierAsync
