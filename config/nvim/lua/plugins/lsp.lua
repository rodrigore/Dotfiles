-- Automatically format on save
vim.g.autoformat = false;
local on_attach = function(client, bufnr)
  client.server_capabilities.hoverProvider = false
end
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },
      codelens = {
        enabled = false,
      },
      servers = {
        -- pyright = {
        --   mason = false,
        --   autostart = false,
        -- },
        -- ruff_lsp = {
        --   mason = true,
        --   autostart = true,
        -- },
        -- intelephense = {
        --    init_options = {
        --     licenceKey = os.getenv('INTELEPHENSE_LICENSE_KEY'),
        --   },
        -- },
      },
    },
    -- init = function()
    --   -- NOTE: https://www.lazyvim.org/plugins/lsp#%EF%B8%8F-customizing-lsp-keymaps
    --   local keys = require("lazyvim.plugins.lsp.keymaps").get()
    --   keys[#keys + 1] = { "<leader>ca", "<cmd>vim.lsp.buf.code_action()<CR>" }
    -- end,
  },
}
