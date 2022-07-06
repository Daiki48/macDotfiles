nnoremap <silent><C-n> :VFiler<CR>
nnoremap <silent><C-e> <Cmd>VFiler -layout=floating<CR>

lua << EOF

-- local action = require("vfiler/action")
-- require("vfiler/config").setup {
-- 	mappings = {
--		['<C-a>'] = action.reload,
--	 },
-- }

EOF
