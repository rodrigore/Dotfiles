require("null-ls").setup({
  debounce = 150,
  save_after_format = true,
  debug = true,
  sources = {
    require("null-ls").builtins.formatting.stylua,
    require("null-ls").builtins.completion.spell,
    require("null-ls").builtins.formatting.phpcsfixer,
    require("null-ls").builtins.formatting.blade_formatter,
    -- require('null-ls').builtins.formatting.eslint_d,
    -- require('null-ls').builtins.formatting.prettier,
  },

  -- on_attach = function(client)
    --         if client.resolved_capabilities.document_formatting then
    --             vim.cmd([[
    --             augroup LspFormatting
    --                 autocmd! * <buffer>
    --                 autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
    --             augroup END
    --             ]])
    --         end
    --     end,
  })
