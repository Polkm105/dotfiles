return {
  {
    'olimorris/codecompanion.nvim',
    version = '^19.0.0',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      adapters = {
        http = {
          ['llama.cpp'] = function()
            return require('codecompanion.adapters').extend(
              'openai_compatible',
              {
                env = {
                  api_key = 'not-needed',
                  url = '10.0.0.130:8080',
                  chat_url = '/v1/chat/completions',
                },
                handlers = {
                  parse_message_meta = function(self, data)
                    local extra = data.extra
                    if extra and extra.reasoning_content then
                      data.output.reasoning =
                        { content = extra.reasoning_content }
                      if data.output.reasoning == '' then
                        data.output.content = nil
                      end
                    end
                    return data
                  end,
                },
              }
            )
          end,
        },
      },
      interactions = {
        chat = {
          adapter = 'llama.cpp',
        },
        inline = {
          adapter = 'llama.cpp',
        },
      },
    },
  },
}
