vim.pack.add { { src = 'https://github.com/nvim-neotest/neotest', version = vim.version.range '6.*' } }
vim.pack.add { { src = 'https://github.com/nvim-neotest/nvim-nio', version = vim.version.range '1.*' } }
vim.pack.add { { src = 'https://github.com/nvim-neotest/neotest-python', version = vim.version.range '1.*' } }
vim.pack.add { 'https://github.com/nvim-neotest/neotest-go' }

require('neotest').setup {
  adapters = {
    require 'neotest-python' {
      runner = 'pytest',
      extra_args = { '--cov' },
    },
    require 'neotest-go' {
      experimental = { test_table = true },
      args = { '-count=1' },
    },
  },
  summary = {
    open = 'botright 50vsplit',
  },
}
