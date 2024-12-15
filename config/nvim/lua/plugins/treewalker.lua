vim.keymap.set('n', '[j', '<cmd>Treewalker Down<CR>', { noremap = true })
vim.keymap.set('n', '[k', '<cmd>Treewalker Up<CR>', { noremap = true })
vim.keymap.set('n', ']j', '<cmd>Treewalker Left<CR>', { noremap = true })
vim.keymap.set('n', ']k', '<cmd>Treewalker Right<CR>', { noremap = true })
return {
  "aaronik/treewalker.nvim",
  opts = {
    highlight = true -- default is false
  },
}
