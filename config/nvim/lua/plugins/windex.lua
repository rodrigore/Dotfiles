return {
  {
    "declancm/windex.nvim",
    enabled = false,
    config = function()
      require("windex").setup({
        default_keymaps = false,
      })
    end,
    keys = {
      { "<Leader>z", "<Cmd>lua require('windex').toggle_maximize()<CR>" },
    },
  },
}
