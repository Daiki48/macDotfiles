local buf = vim.lsp.buf
local keymap = vim.api.nvim_set_keymap

local nvim_lsp = require('lspconfig')
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
  local opts = {}
  -- tsserver or denols
  if server.name == "tsserver" then
    opts.root_dir = nvim_lsp.util.root_pattern("package.json", "node_modules")
  elseif server.name == "eslint" then
    opts.root_dir = nvim_lsp.util.root_pattern("package.json", "node_modules")
  elseif server.name == "denols" then
    opts.root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc", "deps.ts", "import_map.json")
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
  elseif server.name == "sumneko_lua" then
    -- https://github.com/folke/lua-dev.nvim/blob/main/lua/lua-dev/sumneko.lua
    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua
    local path = {}
    table.insert(path, "?.lua")
    table.insert(path, "?/init.lua")

    opts.settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
          path = path,
        },
        completion = { callSnippet = "Replace" },
        diagnostics = { globals = { 'vim' } },
        workspace = { library = vim.api.nvim_get_runtime_file("", true) },
        telemetry = { enable = false },
      }
    }
  end

  opts.on_attach = function(_, bufnr)
    local bufopts = { noremap = true, silent = true }
    -- keymap(bufnr, 'n', 'gi', buf.implementation, bufopts)
    -- keymap(bufnr, 'n', 'gtD', buf.type_definition, bufopts)
    -- keymap(bufnr, 'n', 'grf', buf.references, bufopts)
    -- keymap(bufnr, 'n', '<space>p', buf.format, bufopts)
  end

  server:setup(opts)
  vim.cmd [[ do User LspAttachBuffers ]]
end)
