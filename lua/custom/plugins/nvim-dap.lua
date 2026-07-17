vim.pack.add { { src = 'https://github.com/mfussenegger/nvim-dap', version = vim.version.range '0.*' } }
vim.pack.add { { src = 'https://github.com/rcarriga/nvim-dap-ui', version = vim.version.range '4.*' } }
vim.pack.add { { src = 'https://github.com/mfussenegger/nvim-dap-python', version = vim.version.range '0.*' } }

require('dapui').setup()
require('dap-python').setup '~/.virtualenvs/debugpy/bin/python'
