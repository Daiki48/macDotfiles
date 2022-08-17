-- local buf = vim.lsp.buf
-- local keymap = vim.api.nvim_set_keymap

local nvim_lsp = require('lspconfig')

local border = {
      {"╔", "FloatBorder"}, -- left_top
      {"═", "FloatBorder"},
      {"╗", "FloatBorder"}, -- right_top
      {"║", "FloatBorder"},
      {"╝", "FloatBorder"}, -- right_bottom
      {"═", "FloatBorder"},
      {"╚", "FloatBorder"}, -- left_bottom
      {"║", "FloatBorder"},
}

-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]


-- mason settings
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
	local node_root_dir = nvim_lsp.util.root_pattern("package.json")
--	local is_node_repo = node_root_dir(vim.api.nvim_buf_set_name(0)) ~= nil

  local opts = {}

	if lsp_capabilities ~= nil then
		opts.capabilities = lsp_capabilities
	end

	if server_name == "tsserver" then
		-- if not is_node_repo then
		-- 	return
		-- end
		opts.settings = { documentFormatting = false }
	elseif server_name == "eslint" then
		-- if not is_node_repo then
		-- 	return
		-- end
		opts.root_dir = node_root_dir
	elseif server_name == "denols" then
		-- if is_node_repo then
		-- 	return
		-- end
		opts.root_dir = nvim_lsp.util.root_pattern(
			"deno.json",
			"deno.jsonc",
			"deps.ts",
			"import_map.json"
		)
		opts.init_options = {
			lint = true,
			unstable = true,
			suggest = {
				imports = {
					hosts = {
						["https://deno.land"] = true,
						["https://cdn.nest.land"] = true,
						["https://crux.land"] = true
					}
				}
			}
		}
	elseif server_name == "tailwindcss" then
		opts.root_dir = nvim_lsp.util.root_pattern("tailwind.config.js")
	elseif server_name == "sumneko_lua" then
		local path = {
			"?.lua",
			"?/init.lua"
		}
		opts.settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
					path = path,
				},
				completion = { callSnippet = "Replace" },
				diagnostics = {
					globals = {
						'vim',
						'lsp_capabilities',
					}
				},
				workspace = { library = vim.api.nvim_get_runtime_file("", true) },
				telemetry = { enable = false },
			}
		}
  end

  -- opts.on_attach = function(_, bufnr)
  --   local buopts = { silent = true, buffer = bufnr }
  --   vim.keymap.set('n', 'gi', buf.implementation, bufopts)
  --   vim.keymap.set('n', 'gtD', buf.type_definition, bufopts)
  --   vim.keymap.set('n', 'grf', buf.references, bufopts)
  --   vim.keymap.set('n', '<space>p', buf.format, bufopts)
  -- end


  nvim_lsp[server_name].setup(opts)
end})


