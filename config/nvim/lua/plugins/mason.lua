require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    -- "blade",
    "eslint",
    "intelephense",
    "stylua",
    "tsserver",
    "volar",
  }
})

