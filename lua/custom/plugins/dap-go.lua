return {
  'leoluz/nvim-dap-go',
  ft = 'go',
  dependencies = {
    'mfussenegger/nvim-dap',
    {
      'jay-babu/mason-nvim-dap.nvim',
      dependencies = 'mason-org/mason.nvim',
      opts = {
        automatic_installation = true,
        ensure_installed = { 'delve' },
      },
    },
  },
  opts = {
    delve = {
      detached = vim.fn.has 'win32' == 0,
    },
  },
}
