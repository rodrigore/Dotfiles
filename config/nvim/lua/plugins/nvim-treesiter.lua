return {
  "nvim-treesitter/nvim-treesitter",
  keys = {
    { "<space>", desc = "Increment Selection" },
  },
  opts = {
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<space>",
        node_incremental = "<space>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
  }
}
