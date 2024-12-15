return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      ['*'] = { 'codespell' },
      python = { "pflake8" },
      javascript = { "eslint" },
      javascriptreact = { "eslint" },
    },
  },
}
