vim.pack.add { { src = 'https://github.com/folke/persistence.nvim', version = vim.version.range '3.*' } }
require('persistence').setup {
  dir = vim.fn.stdpath 'data' .. '/sessions/',
  options = { 'buffers', 'curdir', 'tabpages', 'winsize', 'help', 'globals' },
}
