vim.pack.add { { src = 'https://github.com/NeogitOrg/neogit', version = vim.version.range '0.*' } }
vim.pack.add { { src = 'https://github.com/sindrets/diffview.nvim', version = vim.version.range '1.*' } }
require('neogit').setup {}
vim.keymap.set('n', '<leader>gg', '<cmd>Neogit<cr>', { desc = 'Show Neogit UI' })
