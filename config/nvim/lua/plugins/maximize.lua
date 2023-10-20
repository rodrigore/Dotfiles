return {
  {
    "declancm/maximize.nvim",
    config = function()
      require("maximize").setup({
        default_keymaps = false,
      })
    end,
    keys = {
      { "<Leader>z", "<Cmd>lua require('maximize').toggle()<CR>" },
    },
  },
}
