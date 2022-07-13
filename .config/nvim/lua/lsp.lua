local nvim_lsp = require('lspconfig')
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
  local opts = {}
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
  end

  opts.on_attach = function(client, bufnr)
    -- 略
  end

  server:setup(opts)
  vim.cmd [[ do User LspAttachBuffers ]]
end)
