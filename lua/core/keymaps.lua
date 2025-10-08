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

-- NeoTest Keys
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

-- Keymap to cycle through all windows, including floating ones
vim.keymap.set('n', '<leader>ww', function()
  -- Get a list of all window handles
  local wins = vim.api.nvim_list_wins()

  -- Find the index of the current window in the list
  local current_win_idx = vim.tbl_find(wins, vim.api.nvim_get_current_win())

  -- Calculate the index of the next window, wrapping around to the start
  local next_win_idx = (current_win_idx % #wins) + 1
  local next_win = wins[next_win_idx]

  -- Set focus to the next window
  vim.api.nvim_set_current_win(next_win)
end, { desc = 'Cycle to next window (incl. floating)' })

-- Session Persistance
-- load the session for the current directory
vim.keymap.set('n', '<leader>ld', function()
  require('persistence').load()
end, { desc = '[L]oad session For the current [d]irectory.' })

-- select a session to load
vim.keymap.set('n', '<leader>ls', function()
  require('persistence').select()
end, { desc = '[L]oad [s]elected session.' })

-- load the last session
vim.keymap.set('n', '<leader>ll', function()
  require('persistence').load { last = true }
end, { desc = '[L]oad [L]ast session.' })
