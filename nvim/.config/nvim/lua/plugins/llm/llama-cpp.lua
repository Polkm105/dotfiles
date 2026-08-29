return {
  -- Adapter registration key (defaults to the file name if omitted)
  name = 'llama.cpp',

  -- Adapter definition: { kind, inherit, config }.
  -- `kind` is the adapter table to register under (e.g. 'http'),
  -- `inherit` is the base adapter to extend, or nil for a standalone adapter,
  -- `config` is passed to codecompanion's adapter factory.
  adapter = {
    kind = 'http',
    inherit = 'openai_compatible',
    config = {
      env = {
        api_key = 'not-needed',
        url = 'LLAMA_CPP_URL',
        chat_url = '/v1/chat/completions',
      },
      handlers = {
        parse_message_meta = function(self, data)
          local extra = data.extra
          if extra and extra.reasoning_content then
            data.output.reasoning = { content = extra.reasoning_content }
            if data.output.reasoning == '' then
              data.output.content = nil
            end
          end
          return data
        end,
        form_messages = function(self, messages)
          local system_messages = {}
          local other_messages = {}

          for _, msg in ipairs(messages) do
            if msg.role == 'system' then
              table.insert(system_messages, msg.content)
            else
              table.insert(other_messages, msg)
            end
          end

          local system_message = table.concat(system_messages, '\n\n')

          local final_messages = {
            {
              role = 'system',
              content = system_message,
            },
          }

          for _, msg in ipairs(other_messages) do
            table.insert(final_messages, msg)
          end

          local openai = require 'codecompanion.adapters.http.openai'
          return openai.handlers.form_messages(self, final_messages)
        end,
      },
    },
  },
}
