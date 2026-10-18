return {
  {
    -- The core DAP plugin
    'mfussenegger/nvim-dap',
    dependencies = {
      -- A UI for the debugger
      {
        'rcarriga/nvim-dap-ui',
        config = function()
          local dapui = require 'dapui'
          dapui.setup()
        end,
      },

      -- Configurations for Python debugging
      {
        'mfussenegger/nvim-dap-python',
        config = function()
          -- Make sure to install debugpy: pip install debugpy
          require('dap-python').setup '~/.virtualenvs/debugpy/bin/python'
        end,
      },
    },
  },
}
