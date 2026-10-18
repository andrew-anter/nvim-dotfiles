return {
  'Davidyz/inlayhint-filler.nvim',
  keys = {
    {
      '<leader>ti',
      function()
        require('inlayhint-filler').fill()
      end,
      mode = { 'n', 'v' },
      desc = '[I]nsert type annotation from [I]nlay hint',
    },
  },
}
