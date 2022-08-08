local cmd = vim.cmd

-- insertモードを離れると日本語入力をオフ
cmd('augroup fcitx')
cmd('autocmd!')
cmd("autocmd InsertLeave * :call system('fcitx-remote -c')")
cmd("autocmd CmdlineLeave * :call system('fcitx-remote -c')")
cmd('augroup END')

cmd('augroup MyXML')
    cmd('autocmd!')
    cmd('autocmd Filetype html inoremap <buffer> </<CR> </<C-x><C-o><ESC>F>a<CR><ESC>O')
    cmd('autocmd Filetype html inoremap <buffer> </<Tab> </<C-x><C-o><ESC>F>a')
cmd('augroup END')
