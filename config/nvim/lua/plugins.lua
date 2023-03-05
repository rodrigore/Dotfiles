local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

return require('lazy').setup({
  -- comment
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    module = 'ts_context_commentstring',
  },
  {
    'echasnovski/mini.comment',
    config = function()
      require('plugins.mini-comment')
    end,
  },

  -- Format, Lint
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
        require("plugins.null-ls")
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Fuzzy finder
  { 'ibhagwan/fzf-lua',
    config = function () require("plugins.fzf-lua") end,
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

  -- Git
  {
    'tpope/vim-fugitive',
    dependencies = 'tpope/vim-rhubarb',
  },

  {
    'lewis6991/gitsigns.nvim',
    config = function() require('plugins.gitsigns') end
  },

  -- LSP
  {
    "williamboman/mason.nvim",
    config = function() require('plugins.mason') end
  },
  {
    "williamboman/mason-lspconfig.nvim",
  },
  {
    "neovim/nvim-lspconfig",
    config = function() require('plugins.lsp') end
  },

  -- Pairs
  {
    'echasnovski/mini.pairs',
    config = function() require('mini.pairs').setup() end,
  },

  -- maximizer
  {
    "declancm/windex.nvim",
    config = function() require('plugins.windex') end
  },

  -- Split-Join lines
  {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter' },
    config = function()
      require('treesj').setup({})
    end,
  },

  -- Surround text
  {
    "echasnovski/mini.surround",
    config = function() require('plugins.mini-surround') end,
  },

   -- NvimTree
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function() require('plugins.nvimtree') end,
  },

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {{'nvim-lua/plenary.nvim'}},
    config = function() require('plugins.telescope') end,
  },
  {'nvim-telescope/telescope-fzf-native.nvim', build ='make'},

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    version = '*',
    config = function() require("plugins.toggleterm") end
  },

  -- Test
  {
    'vim-test/vim-test',
    dependencies = {{'benmills/vimux'}},
    config = function () require ('plugins.vim-test') end
  },

  -- Themes
   {
    'folke/tokyonight.nvim',
    config = function() require('plugins.tokyonight') end,
  },

   -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    config = function() require('plugins.treesitter') end,
    build = ':TSUpdate'
  },

  -- Vim easy align
  'junegunn/vim-easy-align',
})
