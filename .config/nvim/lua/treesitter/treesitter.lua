require('nvim-treesitter.configs').setup {
	ensure_installed = {
		"html",
		"lua",
		"vim",
		"typescript",
		"toml",
		"javascript",
		"rust",
		"css",
		"json",
		"yaml",
	},
	-- highlight = {
	-- 	enable = true,
	-- },
	indent = {
		disable = true
	},
	sync_install = false,
	yati = {
		enable = true,
	},
}
