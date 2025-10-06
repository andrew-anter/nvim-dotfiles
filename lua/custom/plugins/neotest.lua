return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/neotest-python', -- The adapter for Python
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-python' {
            -- Tell neotest to use pytest
            runner = 'pytest',
          },
        },
      }
    end,
  },
}
