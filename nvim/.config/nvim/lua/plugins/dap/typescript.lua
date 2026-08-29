return {
  setup = function()
    local dap = require 'dap'

    -- TypeScript reuses the JavaScript configurations (loaded first)
    dap.configurations.typescript = dap.configurations.javascript
    dap.configurations.typescriptreact = dap.configurations.javascriptreact
  end,
}
