-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Numbers
vim.wo.number = false
vim.wo.relativenumber = false

-- Disable fancy status column from Lazyvim
vim.opt.statuscolumn = ''

-- folding
-- vim.opt.foldtext = ''
-- vim.opt.foldexpr = ''
-- vim.o.formatexpr = ''

-- Backup and swap
vim.o.swapfile = false
vim.o.backup = false
vim.opt.undofile = true -- Maintain undo history between sessions
vim.opt.undodir = vim.fn.expand("~/.vim/undodir") -- set dir for persistent undo
