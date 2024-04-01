return {
    'vim-test/vim-test',
    dependencies = {
      'benmills/vimux'
    },
    config = function ()
      vim.keymap.set('n', '<Leader>tt', ':TestNearest<CR>')
      vim.keymap.set('n', '<Leader>T', ':TestFile<CR>')
      vim.keymap.set('n', '<Leader>ta', ':TestSuite<CR>')
      vim.keymap.set('n', '<Leader>tl', ':TestLast<CR>')

      vim.g['test#strategy'] = 'vimux'
      vim.g['test#javascript#jest#options'] = '--config=test/jest.config.js'
      vim.g['test#python#runner'] = 'pytest'
      -- vim.g['test#project_root'] = "./app/"

      -- vim.g['test#javascript#jest#options'] = "--config=public/js/__tests__/jest.config.js"
    end
  }
