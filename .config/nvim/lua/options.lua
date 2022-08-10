-- options おすすめ

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.shell = 'fish'
vim.opt.scrolloff = 10
vim.opt.cmdheight = 1
vim.opt.inccommand = 'split'
vim.opt.breakindent = true

vim.o.helplang = 'ja,en'
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.splitright = true
vim.o.termguicolors = true
vim.o.hidden = true
vim.o.updatetime = 300
vim.bo.expandtab = true
vim.bo.autoindent = false
vim.bo.smartindent = false
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.bo.autoread = true
-- vim.wo.number = true
-- vim.wo.relativenumber = true
vim.wo.signcolumn = 'yes'
vim.o.cursorline = true
vim.cmd 'set clipboard+=unnamedplus'
vim.cmd 'set wildoptions=pum'

