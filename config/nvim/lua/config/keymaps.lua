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
-- vim.keymap.del("n", "<leader>w")
-- vim.keymap.del("n", "<leader>ww")
-- vim.keymap.del("n", "<leader>wd")
-- vim.keymap.del("n", "<leader>w-")
-- vim.keymap.del("n", "<leader>w|")
-- vim.keymap.del("n", "<leader>wm")

-- lsp
vim.keymap.set("n", "<leader>cc", "<cmd>CodeActionMenu<cr>", { desc = "Code Action Menu" })

-- harpoon
vim.keymap.set("n", "<leader>m", "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = "Add to Harpoon" })
vim.keymap.set("n", "<leader>0", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = "Show Harpoon" })
vim.keymap.set("n", "<leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", { desc = "Harpoon Buffer 1" })
vim.keymap.set("n", "<leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", { desc = "Harpoon Buffer 2" })
vim.keymap.set("n", "<leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", { desc = "Harpoon Buffer 3" })
vim.keymap.set("n", "<leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", { desc = "Harpoon Buffer 4" })

-- vscode
if vim.g.vscode then

  -- TODO:
  -- vim alignment https://github.com/tommcdo/vim-lion
  -- harpoon https://github.com/tobias-z/vscode-harpoon

  vim.keymap.set("n", "<C-u>", "<C-u>zz")
  vim.keymap.set("n", "<C-d>", "<C-d>zz")

  -- vscode-multi-cursor
  vim.api.nvim_set_hl(0, 'VSCodeCursor', {
    bg = '#542fa4',
    fg = 'white',
  })

  vim.api.nvim_set_hl(0, 'VSCodeCursorRange', {
    bg = '#542fa4',
    fg = 'white',
  })

  local cursors = require('vscode-multi-cursor')
  vim.keymap.set({'n', 'x', 'i'}, '<c-d>', function()
    cursors.addSelectionToNextFindMatch()
  end)

  vim.keymap.set({'n', 'x', 'i'}, '<cs-d>', function()
    cursors.addSelectionToPreviousFindMatch()
  end)

  vim.keymap.set({'n', 'x', 'i'}, '<cs-l>', function()
    cursors.selectHighlights()
  end)

  vim.keymap.set('n', '<c-d>', 'mciw*:nohl<cr>', {
    remap = true
  })

  -- maximize
  vim.keymap.set('n', '<leader>z', "<cmd>call VSCodeNotify('workbench.action.toggleMaximizeEditorGroup')<CR>")

  -- Resize VSCode editor panes
  vim.api.nvim_set_keymap('n', '<Left>', [[<Cmd>call VSCodeNotify('workbench.action.decreaseViewWidth')<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<Right>', [[<Cmd>call VSCodeNotify('workbench.action.increaseViewWidth')<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<Up>', [[<Cmd>call VSCodeNotify('workbench.action.decreaseViewHeight')<CR>]], { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<Down>', [[<Cmd>call VSCodeNotify('workbench.action.increaseViewHeight')<CR>]], { noremap = true, silent = true })

  -- diagnostic
  vim.keymap.set('n', ']d', "<cmd>call VSCodeNotify('editor.action.marker.next')<CR>")
  vim.keymap.set('n', '[d', "<cmd>call VSCodeNotify('editor.action.marker.prev')<CR>")

  -- explorer
  vim.keymap.set('n', '<leader>n', "<cmd>call VSCodeNotify('workbench.view.explorer')<CR>", { noremap = true, silent = true })
  -- vim.keymap.set('n', '<leader>n', "<cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>", { noremap = true, silent = true })
  vim.keymap.set('n', '<leader>,', [[<Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>]])

  -- git
  vim.keymap.set('n', '<leader>gs', [[<Cmd>call VSCodeNotify('workbench.view.scm')<CR>]], { noremap = true, silent = true })
  vim.keymap.set('n', '<leader>hr', "<cmd>call VSCodeNotify('git.revertSelectedRanges')<CR>")
  -- vim.keymap.set('n', '<leader>hr', "<cmd>call RevertLineOrRange()<CR>", {noremap = true, silent = true})

  vim.keymap.set('n', '<leader>hs', "<cmd>call VSCodeNotify('git.stageSelectedRanges')<CR>")
  vim.keymap.set('n', ']h', "<cmd>call VSCodeNotify('workbench.action.editor.nextChange')<CR>")
  vim.keymap.set('n', '[h', "<cmd>call VSCodeNotify('workbench.action.editor.previousChange')<CR>")

  -- lazygit
  vim.keymap.set('n', '<leader>gg', "<cmd>call VSCodeNotify('lazygit-vscode.toggle')<CR>")

  -- git-lenses
  vim.keymap.set('n', '<leader>gc', "<cmd>call VSCodeNotify('gitlens.toggleFileChanges')<CR>", {silent = true})
  vim.keymap.set('n', '<leader>gb', "<cmd>call VSCodeNotify('gitlens.toggleFileBlame')<CR>", {silent = true})
  vim.keymap.set('n', '<leader>gm', "<cmd>call VSCodeNotify('gitlens.toggleFileHeatmap')<CR>", {silent = true})
  vim.keymap.set('n', '<leader>gh', "<cmd>call VSCodeNotify('gitlens.showQuickFileHistory')<CR>", {silent = true})
  vim.keymap.set('n', '<leader>gd', "<cmd>call VSCodeNotify('gitlens.diffWithPrevious')<CR>", {silent = true})

  -- git-graph
  vim.keymap.set('n', '<leader>lg', "<cmd>call VSCodeNotify('git-graph.view')<CR>", {silent = true})

  -- test (Test Explorer Extension)
  vim.keymap.set('n', '<leader>t', "<cmd>call VSCodeNotify('testing.runAtCursor')<CR>")
  vim.keymap.set('n', '<leader>T', "<cmd>call VSCodeNotify('testing.runAll')<CR>")

  -- Copilot chat
  vim.keymap.set('n', '<leader>a', "<cmd> call VSCodeNotify('workbench.action.chat.openInEditor')<CR>", {silent = true})

  -- nnoremap ]h <Cmd>call VSCodeNotify('workbench.action.editor.nextChange')<CR>
  -- nnoremap [h <Cmd>call VSCodeNotify('workbench.action.editor.previousChange')<CR>
  


  -- undo history: https://github.com/vscode-neovim/vscode-neovim/issues/474
  local cmd = vim.api.nvim_command
  _G.vscode_undo_read = function()
      local buf = vim.fn.expand("%")
      local ufile = vim.o.undodir .. "/" .. buf:gsub("[^a-zA-Z]", "_")
      if vim.fn.filereadable(ufile) == 1 then
          cmd("rundo " .. ufile)
      end
  end

  _G.vscode_undo_write = function()
      local buf = vim.fn.expand("%")
      local ufile = vim.o.undodir .. "/" .. buf:gsub("[^a-zA-Z]", "_")
      cmd("wundo " .. ufile)
  end

  cmd("autocmd BufEnter * lua _G.vscode_undo_read()")
  cmd("autocmd BufUnload * lua _G.vscode_undo_write()")
  cmd("autocmd InsertLeave * lua _G.vscode_undo_write()")

end
