hi ALEErrorSign ctermfg=9 guifg=#C30500
hi ALEWarningSign ctermfg=11 guifg=#ED6237

let g:ale_fixers = {
\  'typescript': ['prettier'],
\  'typescriptreact': ['prettier'],
\  'javascript': ['prettier'],
\  'javascriptreact': ['prettier'],
\  'css': ['prettier'],
\}

let g:ale_fix_on_save = 1
let g:ale_sign_error = "●"
let g:ale_sign_warning = "●"
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_statusline_format = ['E%d', 'W%d', 'OK']
let g:ale_sign_column_always = 1
let g:ale_fix_save = 1
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_typescript_prettier_use_local_config = 1
" let g:ale_javascript_prettier_options = '--single-quote --trailing-comma all'
" let g:ale_typescript_prettier_options = '--single-quote --trailing-comma all'

nmap <silent> <C-w>j <Plug>(ale_next_wrap)
nmap <silent> <C-w>k <Plug>(ale_previous_wrap)


