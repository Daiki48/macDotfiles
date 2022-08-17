local lsp_lines = require("lsp_lines")

lsp_lines.setup(
	vim.diagnostic.config({
		virtual_lines = {
			only_current_line = true
		}
	})
)

vim.keymap.set(
	"n",
	"<space>ll",
	lsp_lines.toggle,
	{ desc = "Toggle lsp_lines" }
)
