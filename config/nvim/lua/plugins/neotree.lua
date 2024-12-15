local function getTelescopeOpts(state, path)
  return {
    cwd = path,
    search_dirs = { path },
    attach_mappings = function(prompt_bufnr, map)
      local actions = require("telescope.actions")
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local action_state = require("telescope.actions.state")
        local selection = action_state.get_selected_entry()
        local filename = selection.filename
        if filename == nil then
          filename = selection[1]
        end
        -- any way to open the file without triggering auto-close event of neo-tree?
        require("neo-tree.sources.filesystem").navigate(state, state.path, filename)
      end)
      return true
    end,
  }
end

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>nn", "<cmd>Neotree toggle<cr>", desc = "Explorer NeoTree (root dir)" },
      { "<leader>nf", "<cmd>Neotree reveal<cr>", desc = "Explorer NeoTree (cwd)" },
    },
    opts = {
      enable_git_status = true,
      filesystem = {
        follow_current_file = {
          enabled = false,
          leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
        window = {
          position = 'right',
          mappings = {
            ["tf"] = "telescope_find",
            ["tg"] = "telescope_grep",
          },
        },
        commands = {
          telescope_find = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            require("telescope.builtin").find_files(getTelescopeOpts(state, path))
          end,
          telescope_grep = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            require("telescope.builtin").live_grep(getTelescopeOpts(state, path))
          end,
        },
      },
      default_component_configs = {
        indent = {
          with_expanders = false,
        },
      },
    },
  },
}
