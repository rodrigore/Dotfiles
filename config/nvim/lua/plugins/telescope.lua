local actions = require('telescope.actions')

return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<C-p>", "<cmd>Telescope find_files<CR>", desc = "Find files" },
    },
    opts = {
      defaults = {
        layout_config = {
          -- height = 0.90,
          -- width = 0.90,
          -- horizontal = { preview_width = 0.60 },
          vertical = { width = 0.55, height = 0.9, preview_cutoff = 0 },
          prompt_position = "top",
          preview_cutoff = 120,
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
          theme = "dropdown",
          layout_config = {
            -- width = 0.5,
            -- height = 0.4,
            -- prompt_position = "top",
            -- preview_cutoff = 120,
          },
        },
        commands = {
          prompt_prefix = "   ",
          layout_config = {
            height = 0.63,
            width = 0.78,
          },
        },
        command_history = {
          prompt_prefix = "  ",
          theme = "dropdown",
        },
        git_files = {
          prompt_prefix = " 󰊢 ",
          show_untracked = true,
          theme = "dropdown",
        },
        git_status = {
          prompt_prefix = " 󰊢 ",
          show_untracked = true,
          layout_config = {
            height = 0.63,
            width = 0.78,
          },
          mappings = {
            n = {
              ["<space>"] = actions.git_staging_toggle
            },
          },
        },
        find_files = {
          previewer = false,
          prompt_prefix = "   ",
          theme = "dropdown",
        },
        live_grep = {
          prompt_prefix = " 󰱽 ",
          theme = "dropdown",
        },
        grep_string = {
          prompt_prefix = " 󰱽 ",
          theme = "dropdown",
        },
      },
    },
  },
}
