vim.pack.add { { src = 'https://github.com/Davidyz/inlayhint-filler.nvim', version = vim.version.range '0.*' } }
vim.keymap.set({ 'n', 'v' }, '<leader>ti', function()
  require('inlayhint-filler').fill()
end, { desc = '[I]nsert [T]ype annotation from Inlay Hint' })
