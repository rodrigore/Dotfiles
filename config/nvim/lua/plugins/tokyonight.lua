require("tokyonight").setup({
  style = "storm",
  styles = {
    sidebars = 'transparent'
  },
  on_colors = function(colors)
      -- colors.bg = "#262337" -- purple
      -- colors.bg = "#222436" -- moon
  end
})

vim.g.tokyonight_italic_comments = false
vim.cmd [[colorscheme tokyonight]]
