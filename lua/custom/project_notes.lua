local function open_project_index()
  -- 1. Detect project root
  local root_markers = { '.git', 'pyproject.toml', 'go.mod', '.nvim' }
  local root_file = vim.fs.find(root_markers, { upward = true })[1]
  local root = root_file and vim.fs.dirname(root_file) or nil

  if not root then
    print 'Not inside a project (no .git or pyproject.toml found)'
    return
  end

  local index_path = root .. '/index.md'
  local file_exists = vim.fn.filereadable(index_path) == 1

  -- 2. Open the file buffer
  vim.cmd('edit ' .. vim.fn.fnameescape(index_path))

  -- 3. If it's a new file, apply the template
  if not file_exists then
    local project_name = vim.fs.basename(root)
    local template = {
      '# Project: ' .. project_name,
      '',
      '## Context',
      '- Description: ',
      '- Tech Stack: ',
      '',
      '## Tasks',
      '- [ ] Initial Setup',
      '',
      '## Notes',
      '',
    }
    -- Insert template at the start of the buffer
    vim.api.nvim_buf_set_lines(0, 0, -1, false, template)
    -- Save the file immediately so it exists on disk
    vim.cmd 'write'
  end
end

-- 4. Set the keybinding
-- Using <leader>pi for [P]roject [I]ndex
vim.keymap.set('n', '<leader>pi', open_project_index, { desc = '[P]roject [I]ndex' })
