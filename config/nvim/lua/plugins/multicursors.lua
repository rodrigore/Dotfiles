return {
  "smoka7/multicursors.nvim",
  event = "VeryLazy",
  dependencies = {
    "smoka7/hydra.nvim",
  },
  opts = {
     hint_config = {
        border = 'rounded',
        position = 'bottom-right',
    },
     generate_hints = {
        normal = true,
        insert = true,
        extend = true,
        config = {
            column_count = 1,
        },
    },
  },
  cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
  keys = {
    {
      mode = { "v", "n" },
      "<Leader>m",
      "<cmd>MCstart<cr>",
      desc = "Create a selection for selected text or word under the cursor",
    },
  },
  -- config = function()
  --   local extend = require("multicursors.extend_mode")
  --   require("multicursors").setup({
  --     normal_keys = {
  --       -- use extend motions in normal mode
  --       ["w"] = { method = extend.w_method, opts = {} },
  --       ["e"] = { method = extend.e_method, opts = {} },
  --       ["b"] = { method = extend.b_method, opts = {} },
  --       ["h"] = { method = extend.h_method, opts = {} },
  --       ["l"] = { method = extend.l_method, opts = {} },
  --       ["j"] = { method = extend.j_method, opts = {} },
  --       ["k"] = { method = extend.k_method, opts = {} },
  --       ["o"] = { method = extend.o_method, opts = {} },
  --       ["^"] = { method = extend.caret_method, opts = {} },
  --       ["$"] = { method = extend.dollar_method, opts = {} },
  --     },
  --   })
  -- end,
}
