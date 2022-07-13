local api = vim.api
local fn = vim.fn

require('options')
require('keymaps')
require('autocmd')

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


