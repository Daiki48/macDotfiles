require('options')

-- dein.vimの設定
local api = vim.api

local dein_dir = vim.fn.expand('~/.cache/dein')
local dein_repo_dir = dein_dir..'/repos/github.com/Shougo/dein.vim'

vim.o.runtimepath = dein_repo_dir..','..vim.o.runtimepath

-- dein install check
if (vim.fn.isdirectory(dein_repo_dir) == 0) then
	os.execute('git clone https://github.com/Shougo/dein.vim'..dein_repo_dir)
end

-- begin settings
if (vim.fn['dein#load_state'](dein_dir) == 1) then
	local rc_dir = vim.fn.expand('~/.config/nvim/toml')
	local toml = rc_dir..'/dein.toml'
	vim.fn['dein#begin'](dein_dir)
	vim.fn['dein#load_toml'](toml, { lazy = 0 })
	vim.fn['dein#end']()
	vim.fn['dein#save_state']()
end

-- plugin install check
if (vim.fn['dein#check_install']() ~= 0) then
	vim.fn['dein#install']()
end

-- plugin remove check
local removed_plugins = vim.fn['dein#check_clean']()
if vim.fn.len(removed_plugins) > 0 then
	vim.fn.map(removed_plugins, "delete(v:val, 'rf')")
	vim.fn['dein#recache_runtimepath']()
	local impatient_ok, impatient = pcall(require, "impatient")
	if impatient_ok then
	  impatient.enable_profile()
	end
end

-- leave insert
api.nvim_set_keymap('i', 'jk', '<esc>', { noremap = true })
-- cursor move
api.nvim_set_keymap('n', '<S-j>', '5j', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<S-k>', '5k', { noremap = true, silent = true })
api.nvim_set_keymap('v', '<S-j>', '5j', { noremap = true, silent = true })
api.nvim_set_keymap('v', '<S-k>', '5k', { noremap = true, silent = true })
-- save file
api.nvim_set_keymap('n', '<leader>w', '<cmd>update<cr>', { noremap = true })

-- スペースキーにleaderキーを割り当てる
vim.g.mapleader = ' '

vim.cmd('augroup lua')
vim.cmd('autocmd!')
vim.cmd('autocmd InsertEnter * echo "insert enter"')
vim.cmd('augroup END')

-- insertモードを離れると日本語入力をオフ
vim.cmd('augroup fcitx')
vim.cmd('autocmd!')
vim.cmd("autocmd InsertLeave * :call system('fcitx-remote -c')")
vim.cmd("autocmd CmdlineLeave * :call system('fcitx-remote -c')")
vim.cmd('augroup END')

-- lualine
local lualine = require('lualine')

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'ayu_mirage',
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {
      {
        'filename',
        'g:coc_status'
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
  tabline = {},
  extensions = {}
}

-- タブラインのバッファ切替キーマップ
api.nvim_set_keymap('n', '<C-l>', '<cmd>bnext<cr>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<C-h>', '<cmd>bprevious<cr>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<C-q>', '<cmd>b#<cr><cmd>bd#<cr>', { noremap = true })

-- tsserverとdenolsを切替
local nvim_lsp = require('lspconfig')
local lsp_installer = require("nvim-lsp-installer")

local node_root_dir = nvim_lsp.util.root_pattern("package.json", "node_modules")
local buf_name = api.nvim_buf_get_name(0)
local current_buf = api.nvim_get_current_buf()
local is_node_repo = node_root_dir(buf_name, current_buf) ~= nil

lsp_installer.on_server_ready(function(server)
  local opts = {}

  if server.name == "tsserver" or server.name == "eslint" then
    opts.autostart = is_node_repo
  elseif server.name == "denols" then
    opts.autostart = not(is_node_repo)
    -- 以下は出し分けとは関係ないが設定しておくのがオススメ
    opts.init_options = { lint = true, unstable = true, }
  end

  server:setup(opts)
  vim.cmd [[ do User LspAttachBuffers ]]
end)

