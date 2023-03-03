local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.vim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- comment
  use {
    'JoosepAlviste/nvim-ts-context-commentstring',
    module = 'ts_context_commentstring',
  }
  use {
    'echasnovski/mini.comment',
    config = function()
      require('plugins.mini-comment')
    end,
  }

  -- Format, Lint
  use({
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
        require("plugins.null-ls")
    end,
    requires = { "nvim-lua/plenary.nvim" },
})

  -- Fuzzy finder
  use { 'ibhagwan/fzf-lua',
    config = function () require("plugins.fzf-lua") end,
    requires = { 'nvim-tree/nvim-web-devicons' }
  }

  -- Git
  use({
    'tpope/vim-fugitive',
    requires = 'tpope/vim-rhubarb',
  })

  use {
    'lewis6991/gitsigns.nvim',
    config = function() require('plugins.gitsigns') end
  }

  -- LSP
  use {
    "williamboman/mason.nvim",
    config = function() require('plugins.mason') end
  }
  use {
    "williamboman/mason-lspconfig.nvim",
  }
  use {
    "neovim/nvim-lspconfig",
    config = function() require('plugins.lsp') end
  }


  -- Pairs
  use {
    'echasnovski/mini.pairs',
    config = function() require('mini.pairs').setup() end,
  }

  -- maximizer
  use {
    "declancm/windex.nvim",
    config = function() require('plugins.windex') end
  }

  -- Split-Join lines
  use({
    'Wansmer/treesj',
    requires = { 'nvim-treesitter' },
    config = function()
      require('treesj').setup({})
    end,
  })

  -- Surround text
  use {
    "echasnovski/mini.surround",
    config = function() require('plugins.mini-surround') end,
  }

   -- NvimTree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = 'nvim-tree/nvim-web-devicons',
    config = function() require('plugins.nvimtree') end,
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/plenary.nvim'}},
    config = function() require('plugins.telescope') end,
  }
  use({'nvim-telescope/telescope-fzf-native.nvim', run ='make'})

  -- Terminal
  use {
    "akinsho/toggleterm.nvim",
    tag = '*',
    config = function() require("plugins.toggleterm") end
  }

  -- Test
  use {
    'vim-test/vim-test',
    requires = {{'benmills/vimux'}},
    config = function () require ('plugins.vim-test') end
  }

  -- Themes
   use {
    'folke/tokyonight.nvim',
    config = function() require('plugins.tokyonight') end,
  }

   -- Treesitter
  use({
    'nvim-treesitter/nvim-treesitter',
    config = function() require('plugins.treesitter') end,
    run = ':TSUpdate'
  })

  -- Vim easy align
  use 'junegunn/vim-easy-align'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
