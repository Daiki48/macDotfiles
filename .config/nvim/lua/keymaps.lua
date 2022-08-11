local keymap = vim.api.nvim_set_keymap

-- leave insert
keymap('i', 'jk', '<esc>', { noremap = true })
-- cursor move
keymap('n', '<S-j>', '5j', { noremap = true, silent = true })
keymap('n', '<S-k>', '5k', { noremap = true, silent = true })
keymap('v', '<S-j>', '5j', { noremap = true, silent = true })
keymap('v', '<S-k>', '5k', { noremap = true, silent = true })
-- save file
keymap('n', '<leader>w', '<cmd>update<cr>', { noremap = true })

-- tabs toggle keymapping
keymap('n', '<C-l>', '<cmd>bnext<cr>', { noremap = true, silent = true })
keymap('n', '<C-h>', '<cmd>bprevious<cr>', { noremap = true, silent = true })
-- keymap('n', '<C-q>', '<cmd>b#<cr><cmd>bd#<cr>', { noremap = true })
keymap('n', '<C-q>', '<cmd>bd<cr>', { noremap = true })

-- markdown preview
keymap('n', 'pm', '<cmd>PreviewMarkdown<cr>', { noremap = true })
keymap('n', 'ps', '<cmd>PreviewMarkdownStop<cr>', { noremap = true })
keymap('n', 'pt', '<cmd>PreviewMarkdownToggle<cr>', { noremap = true })



