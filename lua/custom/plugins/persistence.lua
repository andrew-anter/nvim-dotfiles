return {
  'folke/persistence.nvim',
  event = 'BufReadPre', -- this will only start session saving when an actual file was opened
  keys = {
    {
      '<leader>ld',
      function()
        require('persistence').load()
      end,
      desc = '[L]oad session For the current [d]irectory.',
    },
    {
      '<leader>ls',
      function()
        require('persistence').select()
      end,
      desc = '[L]oad [s]elected session.',
    },
    {
      '<leader>ll',
      function()
        require('persistence').load { last = true }
      end,
      desc = '[L]oad [L]ast session.',
    },
  },
  opts = {
    dir = vim.fn.stdpath 'data' .. '/sessions/', -- 📂 The directory where sessions are stored
    options = { 'buffers', 'curdir', 'tabpages', 'winsize', 'help', 'globals' },
  },
}
