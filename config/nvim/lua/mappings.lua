-- source vimrc
vim.keymap.set('n', '<leader>vso', ":so $MYVIMRC<CR>")
vim.keymap.set('n', '<leader>vi', ":vsp $MYVIMRC<CR>")

-- fast save
vim.keymap.set("n", "<leader>w", "<cmd>w!<CR>")
vim.keymap.set("i", "<leader>w", "<cmd>:w<CR>")

--Make Arrowkey do something usefull, resize the viewports accordingly
vim.keymap.set("n", "<Left>", ":vertical resize -5<CR>")
vim.keymap.set("n", "<Right>", ":vertical resize +5<CR>")
vim.keymap.set("n", "<Up>", ":resize -5<CR>")
vim.keymap.set("n", "<Down>", ":resize +5<CR>")
