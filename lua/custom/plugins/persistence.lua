return {
  'folke/persistence.nvim',
  event = 'BufReadPre', -- this will only start session saving when an actual file was opened
  opts = {
    dir = vim.fn.stdpath 'data' .. '/sessions/', -- 📂 The directory where sessions are stored
    options = { 'buffers', 'curdir', 'tabpages', 'winsize', 'help', 'globals' },
  },
}
