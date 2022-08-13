--vim.fn['prettier#autoformat']('0') -- error
vim.cmd("let g:prettier#autoformat = 0")

--vim.fn['prettier#quickfix_enabled']('0') -- error
vim.cmd("let g:prettier#quickfix_enabled = 0")

vim.cmd("autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.vue,*.css,*.scss,*.json,*.md PrettierAsync")
