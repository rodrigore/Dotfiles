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

-- nvim-tree
vim.keymap.set("n", "<leader>nn", "<cmd>NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>nf", "<cmd>NvimTreeFindFile<CR>")

-- vim-easy-align
vim.keymap.set("x", "ga", "<Plug>(EasyAlign)")
vim.keymap.set("n", "ga", "<Plug>(EasyAlign)")

-- fzf-lua
vim.keymap.set('n', '<C-p>', "<cmd>lua require('fzf-lua').files()<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<C-g>', "<cmd>lua require('fzf-lua').live_grep()<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>s', "<cmd>lua require('fzf-lua').git_status()<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>b', "<cmd>lua require('fzf-lua').buffers()<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>v', "<cmd>lua require('fzf-lua').grep_cWORD()<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<C-v>', "<cmd>lua require('fzf-lua').live_grep_resume()<CR>", { noremap = true, silent = true })

-- telescope
-- vim.keymap.set("n", "<c-p>", "<cmd>Telescope find_files<CR>")
-- vim.keymap.set("n", "<leader>g", "<cmd>Telescope live_grep<CR>")
-- vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<CR>")
-- vim.keymap.set("n", "<leader>s", "<cmd>Telescope git_status<CR>")
-- vim.keymap.set("n", "<leader>co", "<cmd>Telescope commands<CR>")
-- vim.keymap.set('n', "<leader>*", function () return ":execute <cmd>Telescope live_grep default_text=" .. vim.fn.expand('<cword>') .. "<cr>" end, { expr = true })

-- treesj (split join lines)
vim.keymap.set("n", "gS", "<cmd>TSJSplit<CR>") -- split node under cursor;
vim.keymap.set("n", "gJ", "<cmd>TSJJoin<CR>")  -- split node under cursor
--:TSJToggle - toggle node under cursor (split if one-line and join if multiline);

-- windex
vim.keymap.set('n', '<Leader>z', "<Cmd>lua require('windex').toggle_maximize()<CR>")
