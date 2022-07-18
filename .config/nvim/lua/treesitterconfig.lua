require('nvim-treesitter.configs').setup {
	ensure_installed = {
		"lua",
		"vim",
		"typescript",
		"toml",
		"javascript",
		"rust",
	},
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	yati = {
		enable = true,
	},
}
