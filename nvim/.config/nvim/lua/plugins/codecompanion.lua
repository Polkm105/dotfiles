return {
  'olimorris/codecompanion.nvim',
  version = '^19.0.0',
  dependencies = {
    'ellisonleao/dotenv.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
    display = {
      chat = {
        show_reasoning = true,
      },
    },
    adapters = {},
    interactions = {},
  },
  config = function(_, opts)
    -- Load all LLM adapter configs from the llm/ directory, mirroring how
    -- the lsp/ and dap/ directories hold per-target configs.
    local llm_config_dir = vim.fn.stdpath 'config' .. '/lua/plugins/llm'
    local config_files = vim.fn.glob(llm_config_dir .. '/*.lua', true, true)
    table.sort(config_files) -- deterministic order

    -- Map of adapter name -> config for later model/interaction resolution.
    local adapters = {}

    for _, config_file in ipairs(config_files) do
      local file_name = vim.fn.fnamemodify(config_file, ':t:r')
      local config = require('plugins.llm.' .. file_name)

      local adapter = config.adapter
      if not adapter then
        goto continue
      end

      local adapter_name = config.name or file_name

      -- Register generically under whatever kind the config declares.
      opts.adapters[adapter.kind] = opts.adapters[adapter.kind] or {}
      opts.adapters[adapter.kind][adapter_name] = function()
        return require('codecompanion.adapters').extend(
          adapter.inherit,
          adapter.config
        )
      end

      adapters[adapter_name] = config
      ::continue::
    end

    -- Resolve default interactions from environment variables.
    --   CC_LLM_ADAPTER: adapter name to use for chat/inline (e.g. 'llama.cpp')
    --   CC_LLM_MODEL:   model to use with that adapter.
    local env_adapter = vim.env.CC_LLM_ADAPTER
    local env_model = vim.env.CC_LLM_MODEL

    if env_adapter then
      if adapters[env_adapter] then
        -- The model travels with the adapter (table form), which
        -- codecompanion resolves into schema.model.default. A bare adapter
        -- name would ignore the model and fall back to the inherited
        -- adapter's dynamic default (the server's last model).
        local adapter = env_model
          and { name = env_adapter, model = env_model }
          or env_adapter
        opts.interactions.chat = opts.interactions.chat or { adapter = adapter }
        opts.interactions.inline = opts.interactions.inline or { adapter = adapter }
      else
        vim.notify(
          ('codecompanion: CC_LLM_ADAPTER %q not found in llm/ configs'):format(
            env_adapter
          ),
          vim.log.levels.WARN
        )
      end
    end

    require('codecompanion').setup(opts)
  end,
}
