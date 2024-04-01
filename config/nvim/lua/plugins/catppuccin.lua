return {
  "catppuccin/nvim",
  name = "catppuccin",
  -- priority = 1000,
  lazy = true,
  opts = {
    flavour = "mocha",
    dim_inactive = {
      enabled = true,
      percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    color_overrides = {
      macchiato = {
        base = "#2A273D",
      },
    },
  },
}
