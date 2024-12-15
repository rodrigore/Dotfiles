return {
  {
    "b0o/incline.nvim",
    enabled = false,
    config = function()
      require("incline").setup({
        window = {
          placement = {
            -- vertical = 'bottom',
          },
        },
        render = function(props)
          local bufname = vim.api.nvim_buf_get_name(props.buf)
          local filename = vim.fn.fnamemodify(bufname, ":t")
          local modified = vim.api.nvim_buf_get_option(props.buf, "modified") and "bold,italic" or "None"
          local modifiedfg = vim.api.nvim_buf_get_option(props.buf, "modified") and "#E5A7A4" or "None"
          local filetype_icon, color = require("nvim-web-devicons").get_icon_color(filename)

          local buffer = {
            { filetype_icon, guifg = color },
            { " " },
            { filename, gui = modified, guifg = modifiedfg },
          }
          local diagnostics = {}
          for _, buffer_ in ipairs(buffer) do
            table.insert(diagnostics, buffer_)
          end
          return diagnostics
        end,
      })
    end,
    opts = {},
  },
}
