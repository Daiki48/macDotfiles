local status, autotag = pcall(require, "nvim-ts-autotag")
if (not status) then return end

autotag.setup({})

-- local autotag = require('nvim-ts-autotag')
-- if not autotag then
-- 	return
-- end

-- local	filetypes = {
--     'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript',
--     'xml',
--     'php',
--     'markdown',
--     'glimmer','handlebars','hbs'
-- }

-- local skip_tags = {
--   'area', 'base', 'br', 'col', 'command', 'embed', 'hr', 'img', 'slot',
--   'input', 'keygen', 'link', 'meta', 'param', 'source', 'track', 'wbr','menuitem'
-- }

-- autotag.setup({
-- 	filetypes = filetypes,
-- 	skip_tags = skip_tags
-- })
