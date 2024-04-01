return {
  "folke/zen-mode.nvim",
  opts = {
    plugins = {
      tmux = { enabled = true }, -- disables the tmux statusline
       wezterm = {
        enabled = true,
        -- can be either an absolute font size or the number of incremental steps
        -- font = "+4", -- (10% increase per step)
      },
    }
  }
}
