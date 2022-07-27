local buf = vim.lsp.buf
-- local keymap = vim.api.nvim_set_keymap

local nvim_lsp = require('lspconfig')
-- local lsp_installer = require("nvim-lsp-installer")

local mason = require('mason')

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

local mason_lspconfig = require('mason-lspconfig')

mason_lspconfig.setup_handlers({ function(server_name)
  local opts = {}

  -- opts.on_attach = function(_, bufnr)
  --   local buopts = { silent = true, buffer = bufnr }
  --   vim.keymap.set('n', 'gi', buf.implementation, bufopts)
  --   vim.keymap.set('n', 'gtD', buf.type_definition, bufopts)
  --   vim.keymap.set('n', 'grf', buf.references, bufopts)
  --   vim.keymap.set('n', '<space>p', buf.format, bufopts)
  -- end

  if server_name == "sumneko_lua" then
	opts.settings = {
		Lua = {
			diagnostics = { globals = { 'vim' } },
		}
	}
  end


  nvim_lsp[server_name].setup(opts)
end})



