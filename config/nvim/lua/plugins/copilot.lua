vim.keymap.set('i', '<Tab>', function()
  if require("copilot.suggestion").is_visible() then
    require("copilot.suggestion").accept()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
  end
end, { desc = "Super Tab" })

return {
  enabled = true,
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  build = ":Copilot auth",
  -- init = function()
  --   vim.g.copilot_no_tab_map = true
  -- end,
  opts = {
    suggestion = {
      auto_trigger = true,
      keymap = {
        accept = false;
        -- accept = "<C-CR>",
        -- next = "<Tab>",
        -- prev = "<S-Tab>",
        -- next = "<M-]>",
        -- prev = "<M-[>",
      },
      copilot_node_command = '/opt/homebrew/bin/node',
    },

    -- suggestion = {
    --   keymap = {
    --     accept = false
    --   },
    --   enabled = true
    -- },
    -- panel = {
    --   enabled = true,
    -- },

    -- recommended options for cmp integration
    -- suggestion = { enabled = false },
    -- panel = { enabled = false },

    -- filetypes = {
    --   markdown = true,
    --   help = true,
    -- },
  },
}
