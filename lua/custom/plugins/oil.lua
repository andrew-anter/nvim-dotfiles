return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  lazy = false,
  keys = {
    { '<leader>e', '<cmd>Oil<cr>', desc = '[E]xplore files.' },
  },
}
vim.keymap.set('n', '<leader>e', '<cmd>Oil<cr>', { desc = '[E]xplore files.' })
