require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },

  -- We must manually specify which parsers to install
  ensure_installed = {
    "comment",
    "css",
    "javascript",
    "json",
    "jsonc",
    "html",
    "php",
    "typescript",
    "vue",
  }
})
