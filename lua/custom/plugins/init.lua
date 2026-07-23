-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Iterate over all Lua files in the plugins directory and load them in sorted order
local plugins_dir = vim.fs.joinpath(vim.fn.stdpath 'config', 'lua', 'custom', 'plugins')
local plugin_files = {}
for file_name, type in vim.fs.dir(plugins_dir, { follow = true }) do
  if (type == 'file' or type == 'link') and file_name:match '%.lua$' and file_name ~= 'init.lua' then
    table.insert(plugin_files, file_name)
  end
end

-- Sort to ensure deterministic load order
table.sort(plugin_files)

for _, file_name in ipairs(plugin_files) do
  local module = file_name:gsub('%.lua$', '')
  require('custom.plugins.' .. module)
end
