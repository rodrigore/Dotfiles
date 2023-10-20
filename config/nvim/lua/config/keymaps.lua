-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- fast save
vim.keymap.set("n", "<leader>w", "<cmd>w!<CR>")
vim.keymap.set("i", "<leader>w", "<cmd>:w<CR>")

--Make arrow keys do something useful, resize the viewports accordingly
vim.keymap.set("n", "<Left>", "<cmd>:vertical resize -5<CR>")
vim.keymap.set("n", "<Right>", "<cmd>:vertical resize +5<CR>")
vim.keymap.set("n", "<Up>", "<cmd>:resize -5<CR>")
vim.keymap.set("n", "<Down>", "<cmd>:resize +5<CR>")

-- disabled windows mapping
vim.api.nvim_del_keymap("n", "<leader>ww")
vim.api.nvim_del_keymap("n", "<leader>wd")
vim.api.nvim_del_keymap("n", "<leader>w-")
vim.api.nvim_del_keymap("n", "<leader>w|")

-- lsp
vim.keymap.set("n", "<leader>cc", "<cmd>CodeActionMenu<cr>", { desc = "Code Action Menu" })

-- harpoon
vim.keymap.set("n", "<leader>m", "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = "Add to Harpoon" })
vim.keymap.set("n", "<leader>0", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = "Show Harpoon" })
vim.keymap.set("n", "<leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", { desc = "Harpoon Buffer 1" })
vim.keymap.set("n", "<leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", { desc = "Harpoon Buffer 2" })
vim.keymap.set("n", "<leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", { desc = "Harpoon Buffer 3" })
vim.keymap.set("n", "<leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", { desc = "Harpoon Buffer 4" })
