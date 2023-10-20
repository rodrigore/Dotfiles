return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  ---@class CatppuccinOptions
  opts = {
    flavour = "macchiato",
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
