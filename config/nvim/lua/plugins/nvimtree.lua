require('nvim-tree').setup({
  view = {
    width = 40,
    side = 'right'
  },
  git = {
    ignore = false,
  },
  renderer = {
    group_empty = true,
    icons = {
      show = {
        folder_arrow = false,
      },
    },
    indent_markers = {
      enable = true,
    },
  },
})
