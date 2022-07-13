local fn = vim.fn

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


