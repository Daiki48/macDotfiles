lua << EOF
local nvim_lsp = require('lspconfig')
local lsp_installer = require("nvim-lsp-installer")

local node_root_dir = nvim_lsp.util.root_pattern("package.json", "node_modules")
local buf_name = api.nvim_buf_get_name(0)
local current_buf = api.nvim_get_current_buf()
local is_node_repo = node_root_dir(buf_name, current_buf) ~= nil

lsp_installer.on_server_ready(function(server)
  local opts = {}

  if server.name == "tsserver" or server.name == "eslint" then
    opts.autostart = is_node_repo
  elseif server.name == "denols" then
    opts.autostart = not(is_node_repo)
    -- 以下は出し分けとは関係ないが設定しておくのがオススメ
    opts.init_options = { lint = true, unstable = true, }
  end

  server:setup(opts)
  vim.cmd [[ do User LspAttachBuffers ]]
end)
EOF

let g:lsp_settings = {
    \  "sumneko-lua-language-server": {
    \       "workspace_config": {
    \           "Lua": {
    \               "diagnostics": {
    \                   "globals": ["hs", "vim", "it", "describe", "before_each", "after_each"],
    \                   "disable": ["lowercase-global", "undefined-global", "unused-local", "unused-vararg", "trailing-space"]
    \               }
    \           }
    \       }
    \   }
    \}


