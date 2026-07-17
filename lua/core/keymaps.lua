-- Toggle for the Quickfix list
vim.keymap.set('n', '<leader>cq', function()
  local qf_winid = vim.fn.getqflist({ winid = 0 }).winid
  if qf_winid > 0 and vim.api.nvim_win_is_valid(qf_winid) then
    vim.cmd.cclose()
  else
    vim.cmd.cwindow()
  end
end, { desc = 'Toggle Quickfix List' })

-- NeoTest Keys
vim.keymap.set('n', '<leader>Tn', function()
  require('neotest').run.run()
end, { desc = 'Run nearest test' })
vim.keymap.set('n', '<leader>Tf', function()
  require('neotest').run.run(vim.fn.expand '%')
end, { desc = 'Run tests in current file' })
vim.keymap.set('n', '<leader>Ts', function()
  require('neotest').summary.toggle()
end, { desc = 'Toggle test summary' })
vim.keymap.set('n', '<leader>Td', function()
  require('neotest').run.run { strategy = 'dap' }
end, { desc = 'Debug nearest test' })

-- NVIM - DAP Keys
vim.keymap.set('n', '<F5>', function()
  require('dap').continue()
end, { desc = 'DAP: Continue' })
vim.keymap.set('n', '<F10>', function()
  require('dap').step_over()
end, { desc = 'DAP: Step Over' })
vim.keymap.set('n', '<F11>', function()
  require('dap').step_into()
end, { desc = 'DAP: Step Into' })
vim.keymap.set('n', '<F12>', function()
  require('dap').step_out()
end, { desc = 'DAP: Step Out' })
vim.keymap.set('n', '<leader>b', function()
  require('dap').toggle_breakpoint()
end, { desc = 'DAP: Toggle Breakpoint' })
vim.keymap.set('n', '<leader>B', function()
  require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
end, { desc = 'DAP: Set Conditional Breakpoint' })
vim.keymap.set('n', '<leader>du', function()
  require('dapui').toggle()
end, { desc = 'DAP: Toggle UI' })

-- Cycle through all windows, including floating ones
vim.keymap.set('n', '<leader>ww', function()
  local wins = vim.api.nvim_list_wins()
  local current = vim.api.nvim_get_current_win()
  for i, w in ipairs(wins) do
    if w == current then
      local next_idx = (i % #wins) + 1
      vim.api.nvim_set_current_win(wins[next_idx])
      return
    end
  end
end, { desc = 'Cycle to next window (incl. floating)' })

-- Session Persistance
vim.keymap.set('n', '<leader>ld', function()
  require('persistence').load()
end, { desc = '[L]oad session For the current [d]irectory.' })
vim.keymap.set('n', '<leader>ls', function()
  require('persistence').select()
end, { desc = '[L]oad [s]elected session.' })
vim.keymap.set('n', '<leader>ll', function()
  require('persistence').load { last = true }
end, { desc = '[L]oad [L]ast session.' })
