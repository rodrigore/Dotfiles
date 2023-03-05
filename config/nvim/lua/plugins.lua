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
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      {"<C-p>", "<cmd>lua require('fzf-lua').files()<CR>"},
      {"<C-v>", "<cmd>lua require('fzf-lua').live_grep_resume()<CR>"},
      {"<leader>s", "<cmd>lua require('fzf-lua').git_status()<CR>"},
      {"<leader>b", "<cmd>lua require('fzf-lua').buffers()<CR>"},
      {"<leader>v", "<cmd>lua require('fzf-lua').grep_cWORD()<CR>"},
      {"<leader>m", "<cmd>lua require('fzf-lua').keymaps()<CR>"},
    }
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
    config = function() require('plugins.windex') end,
    keys = {
      { "<Leader>z", "<Cmd>lua require('windex').toggle_maximize()<CR>"},
    }
  },

  -- Split-Join lines
  {
    'Wansmer/treesj',
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

  -- Search
  {
    "windwp/nvim-spectre",
    dependencies = {'windwp/nvim-spectre'},
    keys = {
      { "<leader>SS", "<cmd>lua require('spectre').open()<CR>" },
      { "<leader>SV", "<esc>:lua require('spectre').open_visual()<CR>" },
      { "<leader>SW", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>" },
      { "<leader>SF", "viw:lua require('spectre').open_file_search()<cr>" },
    },
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
    keys = {
      { "<leader>nn", "<cmd>NvimTreeToggle<CR>"},
      { "<leader>nf", "<cmd>NvimTreeFindFile<CR>"},
    }
  },

  -- Telescope
  -- {
    -- 'nvim-telescope/telescope.nvim',
    -- dependencies = {{'nvim-lua/plenary.nvim'}},
    -- config = function() require('plugins.telescope') end,
    -- keys = {
      -- { "<C-p>", "<cmd>Telescope find_files<CR>" },
      -- { "<leader>g", "<cmd>Telescope live_grep<CR>" },
      -- { "<leader>b", "<cmd>Telescope buffers<CR>" },
      -- { "<leader>s", "<cmd>Telescope git_status<CR>" },
      -- { "<leader>co", "<cmd>Telescope commands<CR>" },
      -- { "<leader>*", function () return ":execute <cmd>Telescope live_grep default_text=" .. vim.fn.expand('<cword>') .. "<cr>" end, { expr = true } },
    -- }
  -- },
  -- {'nvim-telescope/telescope-fzf-native.nvim', build ='make'},

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
  {
    'junegunn/vim-easy-align',
    keys = {
      { "ga",  "<Plug>(EasyAlign)", mode = "x"},
      { "ga",  "<Plug>(EasyAlign)"},
    }
  }
})
