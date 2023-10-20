return {
  {
    "wansmer/treesj",
    dependencies = { 'nvim-treesitter' },
    config = function()
      require('treesj').setup({})
    end,
    keys = {
      { "gS", "<cmd>TSJSplit<CR>" },
      { "gJ", "<cmd>TSJJoin<CR>" },
      --:TSJToggle - toggle node under cursor (split if one-line and join if multiline);
    }
  },
}
