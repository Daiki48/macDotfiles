local api = vim.api
local cmd = vim.cmd
local fn = vim.fn
local keymap = api.nvim_set_keymap

require('options')
-- dein.vim init settings

local dein_dir = fn.expand('~/.cache/dein')
local dein_repo_dir = dein_dir..'/repos/github.com/Shougo/dein.vim'

vim.o.runtimepath = dein_repo_dir..','..vim.o.runtimepath

-- dein install check
if (fn.isdirectory(dein_repo_dir) == 0) then
	os.execute('git clone https://github.com/Shougo/dein.vim'..dein_repo_dir)
end

-- begin settings
if (fn['dein#load_state'](dein_dir) == 1) then
	local rc_dir = fn.expand('~/.config/nvim/toml')
	local toml = rc_dir..'/dein.toml'
	local lazy_toml = rc_dir..'/dein_lazy.toml'
	fn['dein#begin'](dein_dir)
	fn['dein#load_toml'](toml, { lazy = 0 })
	fn['dein#load_toml'](lazy_toml, { lazy = 1 })
	fn['dein#end']()
	fn['dein#save_state']()
end

-- plugin install check
if (fn['dein#check_install']() ~= 0) then
	fn['dein#install']()
end

-- plugin remove check
local removed_plugins = fn['dein#check_clean']()
if fn.len(removed_plugins) > 0 then
	fn.map(removed_plugins, "delete(v:val, 'rf')")
	fn['dein#recache_runtimepath']()
	local impatient_ok, impatient = pcall(require, "impatient")
	if impatient_ok then
	  impatient.enable_profile()
	end
end

-- leave insert
keymap('i', 'jk', '<esc>', { noremap = true })
-- cursor move
keymap('n', '<S-j>', '5j', { noremap = true, silent = true })
keymap('n', '<S-k>', '5k', { noremap = true, silent = true })
keymap('v', '<S-j>', '5j', { noremap = true, silent = true })
keymap('v', '<S-k>', '5k', { noremap = true, silent = true })
-- save file
keymap('n', '<leader>w', '<cmd>update<cr>', { noremap = true })

-- insertモードを離れると日本語入力をオフ
cmd('augroup fcitx')
cmd('autocmd!')
cmd("autocmd InsertLeave * :call system('fcitx-remote -c')")
cmd("autocmd CmdlineLeave * :call system('fcitx-remote -c')")
cmd('augroup END')

-- lualine
local lualine = require('lualine')

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'iceberg_dark',
    component_separators = {left = '', right = ''},
    section_separators = {left = '', right = ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {
      'mode',
    },
    lualine_b = {
      'branch',
      'diff',
      'diagnostics'
    },
    lualine_c = {
      {
        'filename',
      }
    },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {'buffers'},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'tabs'}
  },
  extensions = {}
}

-- tabs toggle keymapping
keymap('n', '<C-l>', '<cmd>bnext<cr>', { noremap = true, silent = true })
keymap('n', '<C-h>', '<cmd>bprevious<cr>', { noremap = true, silent = true })
-- keymap('n', '<C-q>', '<cmd>b#<cr><cmd>bd#<cr>', { noremap = true })
keymap('n', '<C-q>', '<cmd>bd<cr>', { noremap = true })

-- telescope command-line
keymap('n', 'ff', '<cmd>Telescope find_files<cr>', { noremap = true })
keymap('n', 'fg', '<cmd>Telescope live_grep<cr>', { noremap = true })
keymap('n', 'fb', '<cmd>Telescope buffers<cr>', { noremap = true })
keymap('n', 'fh', '<cmd>Telescope help_tags<cr>', { noremap = true })


