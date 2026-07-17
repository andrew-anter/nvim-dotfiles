vim.pack.add { { src = 'https://github.com/nvim-neotest/neotest', version = vim.version.range '6.*' } }
vim.pack.add { { src = 'https://github.com/nvim-neotest/nvim-nio', version = vim.version.range '1.*' } }
vim.pack.add { { src = 'https://github.com/nvim-neotest/neotest-python', version = vim.version.range '1.*' } }

require('neotest').setup {
  adapters = {
    require 'neotest-python' {
      runner = 'pytest',
      extra_args = { '--cov' },
    },
  },
  summary = {
    open = 'botright 50vsplit',
  },
}
