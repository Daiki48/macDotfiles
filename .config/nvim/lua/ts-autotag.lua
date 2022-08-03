require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
    filetypes = {
      'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'tsx', 'jsx', 'markdown', 'glimmer', 'handlebars', 'hbs'
    },
    skip_tags = {
      'br', 'img', 'input', 'meta', 'link', 'source'
    },
  }
}

