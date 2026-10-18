return {
  'yetone/avante.nvim',
  build = 'make',
  event = 'VeryLazy',
  version = false, -- Never set this to '*'
  ---@module 'avante'
  ---@type avante.Config
  opts = {
    provider = 'glm',
    providers = {
      glm = {
        endpoint = 'https://api.z.ai/api/coding/paas/v4',
        model = 'glm-5.3-flash',
        api_key_name = 'ZAI_API_KEY',
        timeout = 30000,
        extra_request_body = {
          max_tokens = 32768,
        },
      },
      qwen_local = {
        __inherited_from = 'openai',
        endpoint = 'http://10.0.0.99:8080/v1',
        model = 'qwen3.8-flash-next-iq3_xxs',
        api_key_name = '', -- local llama.cpp server needs no auth header
        timeout = 60000,
        extra_request_body = {
          max_tokens = 32768,
        },
      },
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    { 'ColinKennedy/mega.cmdparse', dependencies = { 'ColinKennedy/mega.logging' } },
    'nvim-tree/nvim-web-devicons',
    {
      'HakonHarnes/img-clip.nvim',
      event = 'VeryLazy',
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
        },
      },
    },
  },
}
