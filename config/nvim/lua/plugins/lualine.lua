-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore
-- tokyonight colors
-- local colors = {
--   blue   = '#80a0ff',
--   cyan   = '#79dac8',
--   black  = '#080808',
--   white  = '#c6c6c6',
--   red    = '#ff5189',
--   purple = '#d183e8',
--   grey   = '#303030',
-- }
local Util = require("lazyvim.util")
local icons = require("lazyvim.config").icons

-- duskfoxcolors
local colors = {
  blue   = '#80a0ff',
  black  = '#080808',

  white  = '#e0def4',
  cyan   = '#9ccfd8',
  grey   = '#817c9c',
  red    = '#eb6f92',
  purple= '#c4a7e7',
  orange = '#ea9a97',
  yellow = '#f6c177',
  green = '#a3be8c',
}

local rodri_theme = {
  normal = {
    a = { fg = colors.grey, bg = '' },
    b = { fg = colors.purple, bg = '' },
    c = { fg = colors.grey, bg = '' },
  },

  insert = { a = { fg = colors.purple, bg = '' } },
  visual = { a = { fg = colors.green, bg = '' } },
  replace = { a = { fg = colors.yellow, bg = '' } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
  },
}

return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = rodri_theme,
        -- component_separators = '|',
        component_separators = { left = "", right = "" },
        section_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = "" },
      },
      sections = {
        lualine_a = {
          { 'mode', separator = { left = '' }, right_padding = 2 },
        },
        -- lualine_b = { 'filename'},
        -- lualine_c = { 'fileformat' },
        lualine_x = {
          -- {
          --   function() return require("noice").api.status.command.get() end,
          --   cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
          --   color = Util.ui.fg("Statement"),
          -- },
          -- stylua: ignore
          {
            function() return require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            color = Util.ui.fg("Constant"),
          },
          -- stylua: ignore
          {
            function() return "  " .. require("dap").status() end,
            cond = function () return package.loaded["dap"] and require("dap").status() ~= "" end,
            color = Util.ui.fg("Debug"),
          },
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = Util.ui.fg("Special"),
          },
          {
            "diff",
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
        },
        lualine_y = {},
        lualine_z = {
          { 'location', separator = { right = '' }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
    },
  }
}
