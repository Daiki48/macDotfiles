local cmd = vim.cmd

-- insertモードを離れると日本語入力をオフ
cmd('augroup fcitx')
cmd('autocmd!')
cmd("autocmd InsertLeave * :call system('fcitx-remote -c')")
cmd("autocmd CmdlineLeave * :call system('fcitx-remote -c')")
cmd('augroup END')


