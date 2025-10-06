-- Toggle for the Quickfix list
vim.keymap.set('n', '<leader>q', function()
  local qf_open = false
  -- Check if a quickfix window is open
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(win), 'buftype') == 'quickfix' then
      qf_open = true
      break
    end
  end

  if qf_open then
    vim.cmd.cclose()
  else
    -- Use :copen if you always want it to open, or :cwindow
    -- if you only want it to open when there are errors/items.
    vim.cmd.cwindow()
  end
end, { desc = 'Toggle Quickfix List' })

vim.keymap.set('n', '<leader>tt', function()
  require('neotest').run.run()
end, { desc = 'Run nearest test' })
vim.keymap.set('n', '<leader>tT', function()
  require('neotest').run.run(vim.fn.expand '%')
end, { desc = 'Run tests in current file' })
vim.keymap.set('n', '<leader>ts', function()
  require('neotest').summary.toggle()
end, { desc = 'Toggle test summary' })
vim.keymap.set('n', '<leader>td', function()
  require('neotest').run.run { strategy = 'dap' }
end, { desc = 'Debug nearest test' })
