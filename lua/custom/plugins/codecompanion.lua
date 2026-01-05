return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'hrsh7th/nvim-cmp',
    'stevearc/dressing.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('codecompanion').setup {
      strategies = {
        chat = { adapter = 'ollama' },
        inline = { adapter = 'ollama' },
        agent = { adapter = 'ollama' },
      },
      adapters = {
        ollama = function()
          return require('codecompanion.adapters').extend('ollama', {
            env = {
              -- Use localhost for your local machine
              url = 'http://localhost:11434',
            },
            schema = {
              model = {
                -- Change this to "qwen2.5-coder:3b" after you download it
                default = 'qwen2.5-coder:3b-instruct-q5_K_M',
              },
            },
          })
        end,
      },
    }
  end,
}
