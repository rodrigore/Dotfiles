vim.g.mapleader    = ','     -- leader key
vim.opt.laststatus = 3    -- unique status line

-- Backup and swap
vim.o.swapfile   = false
vim.o.backup     = false
vim.opt.undofile = true       		          -- Maintain undo history between sessions
vim.opt.undodir  = vim.fn.expand('~/.vim/undodir') -- set dir for persistent undo

-- Numbers 
vim.wo.number         = true
vim.wo.relativenumber = true

-- Indentation
vim.opt.wrap        = false
vim.opt.linebreak   = true
vim.opt.wrapmargin  = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth  = 2
vim.opt.expandtab   = true  -- Convert tabs to spaces.
vim.opt.smarttab    = true
vim.opt.autoindent  = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.shiftround  = true

-- 
vim.opt.signcolumn = 'yes:1'

-- Search
vim.opt.hlsearch   = true      -- highlight search
vim.opt.ignorecase = true      -- Ignore case when using lowercase in search
vim.opt.smartcase  = true      -- But don't ignore it when using upper case
vim.opt.inccommand = "nosplit" -- preview incremental substitute
vim.opt.grepprg    = "rg --vimgrep"
vim.opt.grepformat = "%f:%l:%c:%m"

-- Statusline
vim.cmd('source ~/.config/nvim/statusline.vim')

-- Window splitting and buffers {{{
vim.opt.ruler        = true
vim.opt.hidden       = true
vim.opt.encoding     = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.splitbelow   = true -- Put new windows below current
vim.opt.splitright   = true -- Put new windows right of current

-- Other
vim.o.clipboard = 'unnamedplus'
vim.opt.autoread  = true
vim.opt.autoread  = true
vim.opt.hidden    = true                -- Open files without saving the current file
vim.opt.backspace = 'indent,eol,start'  -- allow backspacing over everything in insert mode
vim.opt.visualbell = true               -- Don't beep
vim.opt.errorbells = false              -- Don't beep
vim.opt.conceallevel=1
vim.opt.list = true -- Show some invisible characters (tabs...

-- UI
vim.opt.termguicolors = true
vim.opt.background    = 'dark'
vim.opt.showmode      = false    -- Hide mode from bottom status

-- ???
vim.opt.tabstop       = 2
vim.opt.scrolloff     = 12    -- Minimum offset in lines to screen borders
vim.opt.sidescrolloff = 8
vim.opt.mouse         = 'a' --enable mouse mode

