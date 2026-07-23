vim.pack.add { { src = 'https://github.com/mfussenegger/nvim-dap', version = vim.version.range '0.*' } }
vim.pack.add { 'https://github.com/leoluz/nvim-dap-go' }
vim.pack.add { { src = 'https://github.com/jay-babu/mason-nvim-dap.nvim', version = vim.version.range '2.*' } }

require('dap')
require('mason-nvim-dap').setup {
  automatic_installation = true,
  ensure_installed = { 'delve' },
}

require('dap-go').setup {
  delve = {
    detached = vim.fn.has 'win32' == 0,
  },
}
