require('fzf-lua').setup({
  -- "default",
  "telescope",
  winopts = {
    height  = 0.95,
    preview = {
      -- default = "bat",
      -- hidden = 'hidden',
    }
  },
   keymap = {
    builtin = {
      ["<C-d>"] = "preview-page-down",
      ["<C-u>"] = "preview-page-up",
    }
  }
  -- fzf_cli_args = '-i', -- Case-Insensitive for: `Fzf files`, `buffers`.
  -- fzf_opts = {
  --   ['--cycle'] = '',
  --   ['--info'] = 'default', -- UI related: show item-list count, e.g. (42/42), on the next line.
  --   ['--header-lines'] = false, -- make current buffer selectable by `FzfLua buffers`.
  -- },
})
