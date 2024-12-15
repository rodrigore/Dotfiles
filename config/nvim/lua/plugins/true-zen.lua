vim.keymap.set("v", "<leader>Z", ":'<,'>TZNarrow<CR>", {})

return {
    'pocco81/true-zen.nvim',
    enabled = false,
    cmd = { 'TZFocus', 'TZNarrow', 'TZAtaraxis', 'TZMinimalist' },
    keys = {
        { '<leader>Z', '<cmd>TZAtaraxis<cr>', desc = 'Zen Mode' },
        { '<leader>vz', '<cmd>TZFocus<cr>', desc = 'Zen Mode Visual' },
    },
    config = function()
        require('true-zen').setup({
              integrations = {
                tmux = true,
              }
            -- modes = {
            --     ataraxis = {
            --         padding = {
            --             left = 32,
            --             right = 52,
            --             top = 0,
            --             bottom = 0,
            --         },
            --     },
            -- },
        })
    end,
}
