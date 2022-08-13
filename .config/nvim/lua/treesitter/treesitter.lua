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
  autotag = {
	 	enable = true,
		filetypes = {
			'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript',
			'xml',
			'php',
			'markdown',
			'glimmer','handlebars','hbs'
		},
		skip_tags = {
			'area', 'base', 'br', 'col', 'command', 'embed', 'hr', 'img', 'slot',
			'input', 'keygen', 'link', 'meta', 'param', 'source', 'track', 'wbr','menuitem'
		}
	 },
}

require("nvim-ts-autotag").setup()
