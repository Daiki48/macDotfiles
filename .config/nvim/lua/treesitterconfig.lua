require('nvim-treesitter.configs').setup {
	ensure_installed = {
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
	highlight = {
		enable = true,
	},
	sync_install = false,
	yati = {
		enable = true,
	},
  autotag = {
	 	enable = true,
	-- 	filetypes = {
      -- 'html',
	-- 		'javascript',
	-- 		'typescript',
	-- 		'javascriptreact',
	-- 		'typescriptreact',
	-- 		'tsx',
	-- 		'jsx',
	-- 		'markdown',
	-- 		'glimmer',
	-- 		'handlebars',
	-- 		'hbs'
    -- },
    -- skip_tags = {
      -- 'br',
	-- 		'img',
	-- 		'input',
	-- 		'meta',
	-- 		'link',
	-- 		'source'
    -- },
	 },
}

require("nvim-ts-autotag").setup()
