return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters_by_ft = {
      ["python"] = { "black" },
      ["jinja"] = { "djlint"},
      ["html.jinja"] = { "djlint"},
      ["html"] = { "djlint"},
    },
  },
}
