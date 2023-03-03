vim.keymap.set('n', '<Leader>tn', ':TestNearest<CR>')
vim.keymap.set('n', '<Leader>tf', ':TestFile<CR>')
vim.keymap.set('n', '<Leader>ts', ':TestSuite<CR>')
vim.keymap.set('n', '<Leader>tl', ':TestLast<CR>')
vim.keymap.set('n', '<Leader>tv', ':TestVisit<CR>')

vim.g['test#strategy'] = 'vimux'
vim.g['test#javascript#jest#options'] = '--config=test/jest.config.js'
