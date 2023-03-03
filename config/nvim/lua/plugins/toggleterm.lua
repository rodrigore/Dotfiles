-- Setup the plugin
require("toggleterm").setup({
  shade_terminals = false,
})
-- Add a `lazygit` terminal
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = "float",
  float_opts = {
    width = function(_)
      return vim.o.columns - 6
    end,
    height = function(_)
      return vim.o.lines - 5
    end,
  },
  on_open = function(term)
    vim.keymap.set("t", "<C-c>", "<cmd>close<CR>", {
      noremap = true,
      silent = true,
      buffer = term.bufnr,
    })
  end,
})
-- Toggle the state of the `lazygit` terminal
local function lazygit_toggle()
  -- Sync the current directories of the editor and the terminal
  lazygit.dir = vim.fn.getcwd()
  -- Toggle the terminal
  lazygit:toggle()
end

-- Setup the keybindings
vim.keymap.set("n", "<leader>l", lazygit_toggle, { noremap = true, silent = true })
