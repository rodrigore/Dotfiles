local actions = require('telescope.actions')

-- local focus_preview = function(prompt_bufnr)
--   local action_state = require("telescope.actions.state")
--   local picker = action_state.get_current_picker(prompt_bufnr)
--   local prompt_win = picker.prompt_win
--   local previewer = picker.previewer
--   local winid = previewer.state.winid
--   local bufnr = previewer.state.bufnr
--   vim.keymap.set("n", "<Tab>", function()
--     vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", prompt_win))
--   end, { buffer = bufnr })
--   vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", winid))
--   -- api.nvim_set_current_win(winid)
-- end

return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<C-p>", "<cmd>Telescope find_files<CR>", desc = "Find files" },
    },
    opts = {
      defaults = {
        layout_config = {
          -- height = 0.9,
          -- width = 0.9,
          -- horizontal = { preview_width = 0.60 },
          -- vertical = { width = 0.7, height = 0.9, preview_cutoff = 0 },
          prompt_position = "top",
          preview_cutoff = 120,
          -- height = 0.6,
          -- width = 0.7,
        },
        path_display = {
          "filename_first",
        },
        -- path_display = { "smart" },
        prompt_prefix = "   ",
        selection_caret = "  ",
        sorting_strategy = "ascending",
      },
      pickers = {
        buffers = {
          prompt_prefix = "󰸩 ",
          previewer = false,
          -- theme = "dropdown",
          layout_config = {
            -- width = 0.5,
            -- height = 0.4,
            -- height = 0.6,
            -- width = 0.7,
            -- prompt_position = "top",
            -- preview_cutoff = 120,
          },
        },
        commands = {
          prompt_prefix = "   ",
          -- layout_config = {
          --   height = 0.63,
          --   width = 0.78,
          -- },
        },
        command_history = {
          prompt_prefix = "  ",
          -- theme = "dropdown",
        },
        git_files = {
          prompt_prefix = " 󰊢 ",
          show_untracked = true,
          -- theme = "dropdown",
        },
        git_status = {
          prompt_prefix = " 󰊢 ",
          show_untracked = true,
          -- layout_config = {
          --   height = 0.63,
          --   width = 0.78,
          -- },
          mappings = {
            n = {
              ["<space>"] = actions.git_staging_toggle
            },
          },
        },
        find_files = {
          previewer = false,
          prompt_prefix = "   ",
          -- theme = "dropdown",
          -- layout_config = {
          --   height = 0.6,
          --   width = 0.7,
          -- },
        },
        live_grep = {
          prompt_prefix = " 󰱽 ",
          -- theme = "dropdown",
          -- layout_config = {
          --   height = 0.9,
          --   width = 0.9,
          -- },
        },
        grep_string = {
          prompt_prefix = " 󰱽 ",
          -- theme = "dropdown",
          -- layout_config = {
          --   height = 0.63,
          --   width = 0.78,
          -- },
        },
      },
    },
  },
}
