return {
  "sindrets/diffview.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  cmd = {
    "DiffviewOpen",
    "DiffviewClose",
    "DiffviewFileHistory",
    -- "DiffviewToggleFiles",
    -- "DiffviewFocusFiles",
    "DiffviewRefresh",
  },
  opts = function ()
    local actions = require("diffview.actions")
    return {
      view = {
        use_icons = true,
        default = {
          -- layout = "diff2_horizontal",
          winbar_info = false, -- See ':h diffview-config-view.x.winbar_info'
        },
      },
      hooks = {
        view_opened = function()
          local stdout = vim.loop.new_tty(1, false)
          if stdout ~= nil then
            stdout:write(
              ("\x1bPtmux;\x1b\x1b]1337;SetUserVar=%s=%s\b\x1b\\"):format("DIFF_VIEW", vim.fn.system({ "base64" }, "+4"))
            )
            vim.cmd([[redraw]])
          end
        end,
        view_closed = function()
          local stdout = vim.loop.new_tty(1, false)
          if stdout ~= nil then
            stdout:write(
              ("\x1bPtmux;\x1b\x1b]1337;SetUserVar=%s=%s\b\x1b\\"):format("DIFF_VIEW", vim.fn.system({ "base64" }, "-1"))
            )
            vim.cmd([[redraw]])
          end
        end,
      },
      keymaps = {
        view = {
          { "n", "<leader>gco", actions.conflict_choose("ours"), { desc = "Choose OURS version" } },
          { "n", "<leader>gct", actions.conflict_choose("theirs"), { desc = "Choose THEIRS version" } },
          { "n", "<leader>gcb", actions.conflict_choose("base"), { desc = "Choose BASE version" } },
          { "n", "<leader>gca", actions.conflict_choose("all"), { desc = "Choose ALL versions" } },
          { "n", "<leader>gcn", actions.next_conflict, { desc = "Next conflict" } },
          { "n", "<leader>gcp", actions.prev_conflict, { desc = "Previous conflict" } },
        },
      },
    }
  end,
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "DiffviewOpen" },
    { "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "DiffviewClose" },

    -- { "n", "<leader>gaa", function() require('diffview.actions').conflict_choose('all') end, { desc = 'Choose all the versions of a conflict' } },
    -- { "n", "<leader>gao", require('diffview.actions').conflict_choose 'ours', { desc = 'Choose the OURS version of a conflict' } },
    -- { "n", "<leader>gab", require('diffview.actions').conflict_choose 'base', { desc = 'Choose the BASE version of a conflict' } },
    -- { "n", "<laeder>gat", require('diffview.actions').conflict_choose 'theirs', { desc = 'Get right version (theirs conflict)' } },
  },
  -- config = function()
  --   require("diffview").setup({
  --       keymaps = {
  --         view = {
  --           { 'n', '<leader>gaa', require('diffview.actions').conflict_choose 'all', { desc = 'Choose all the versions of a conflict' } },
  --           { 'n', '<leader>gao', require('diffview.actions').conflict_choose 'ours', { desc = 'Choose the OURS version of a conflict' } },
  --           { 'n', '<leader>gab', require('diffview.actions').conflict_choose 'base', { desc = 'Choose the BASE version of a conflict' } },
  --           { 'n', '<laeder>gat', require('diffview.actions').conflict_choose 'theirs', { desc = 'Get right version (theirs conflict)' } },
  --         }
  --       },
  --   })
  -- end,
}
