vim.pack.add { { src = 'https://github.com/mfussenegger/nvim-dap', version = vim.version.range '0.*' } }
vim.pack.add { { src = 'https://github.com/rcarriga/nvim-dap-ui', version = vim.version.range '4.*' } }
vim.pack.add { { src = 'https://github.com/mfussenegger/nvim-dap-python', version = vim.version.range '0.*' } }

require('dapui').setup()
local py = vim.fn.expand '~/.virtualenvs/debugpy/bin/python'
if vim.uv.fs_stat(py) then require('dap-python').setup(py) end
