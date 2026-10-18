return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/neotest-python',
    },
    -- Standard lazy.nvim keymaps definition
    keys = {
      {
        '<leader>tt',
        function()
          require('neotest').run.run()
        end,
        desc = 'Run nearest test',
      },
      {
        '<leader>tT',
        function()
          require('neotest').run.run(vim.fn.expand '%')
        end,
        desc = 'Run tests in current file',
      },
      {
        '<leader>td',
        function()
          require('neotest').run.run { strategy = 'dap' }
        end,
        desc = 'Debug nearest test',
      },
      {
        '<leader>tr',
        function()
          require('neotest').run.run()
        end,
        desc = 'Run nearest test',
      },
      {
        '<leader>tf',
        function()
          require('neotest').run.run(vim.fn.expand '%')
        end,
        desc = 'Run test file',
      },
      {
        '<leader>tp',
        function()
          require('neotest').output.open { enter = true }
        end,
        desc = 'Hover test output',
      },
      {
        '<leader>to',
        function()
          require('neotest').output_panel.toggle()
        end,
        desc = 'Toggle test output panel',
      },
      {
        '<leader>ts',
        function()
          require('neotest').summary.toggle()
        end,
        desc = 'Toggle test summary',
      },
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-python' {
            runner = 'pytest',
            python = '.venv/bin/python',
            extra_args = { '--cov' },
          },
        },
        summary = {
          open = 'botright 50vsplit',
        },
        output = {
          -- Opens the floating window automatically when a test fails
          open_on_run = 'short',
        },
      }
    end,
  },
}
