let g:closetag_filenames = '*.html,*.xhtml,*.jsx,*.tsx,*.cshtml'
let g:closetag_xhtml_filenames = '*.html,*.xhtml,*.jsx,*.tsx,*.cshtml'
let g:closetag_filetypes = 'html,xhtml,razor,typescriptreact,javascriptreact,typescript.tsx,javascript.tsx'
let g:closetag_xhtml_filetypes = 'html,xhtml,razor,typescriptreact,javascriptreact,typescript.tsx,javascript.tsx'
let g:closetag_regions = {
  \ 'typescript.tsx': 'jsxRegion,tsxRegion',
  \ 'javascript.jsx': 'jsxRegion',
  \ 'typescriptreact': 'jsxRegion,tsxRegion',
  \ 'javascriptreact': 'jsxRegion',
  \ }
" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'
" Add > at current position without closing the current tag, default is ''
"
" let g:closetag_close_shortcut = '<leader>>'
