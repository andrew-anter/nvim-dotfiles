-- Toggle for the Quickfix list
vim.keymap.set('n', '<leader>q', function()
  local qf_open = false
  -- Check if a quickfix window is open
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.bo[vim.api.nvim_win_get_buf(win)].buftype == 'quickfix' then
      qf_open = true
      break
    end
  end

  if qf_open then
    vim.cmd.cclose()
  else
    vim.cmd.cwindow()
  end
end, { desc = 'Toggle Quickfix List' })

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

-- Yank file path to clipboard
vim.keymap.set('n', '<leader>yp', function()
  local filepath = vim.fn.expand '%:.'
  vim.fn.setreg('+', filepath)
  vim.notify('Yanked: ' .. filepath, vim.log.levels.INFO)
end, { desc = 'Yank [p]ath (relative) to clipboard' })

vim.keymap.set('n', '<leader>ya', function()
  local filepath = vim.fn.expand '%:p'
  vim.fn.setreg('+', filepath)
  vim.notify('Yanked: ' .. filepath, vim.log.levels.INFO)
end, { desc = 'Yank [a]bsolute path to clipboard' })

-- Keymap to cycle through all windows, including floating ones
vim.keymap.set('n', '<leader>ww', function()
  local wins = vim.api.nvim_list_wins()
  local current_win = vim.api.nvim_get_current_win()

  local current_win_idx = 0
  for i, win in ipairs(wins) do
    if win == current_win then
      current_win_idx = i
      break
    end
  end

  local next_win_idx = (current_win_idx % #wins) + 1
  vim.api.nvim_set_current_win(wins[next_win_idx])
end, { desc = 'Cycle to next window (incl. floating)' })
