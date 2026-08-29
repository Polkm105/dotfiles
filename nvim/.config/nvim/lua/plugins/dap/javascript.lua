return {
  setup = function()
    local dap = require 'dap'
    local utils = require 'dap.utils'

    -- Define configurations for JavaScript
    dap.configurations.javascript = {
      {
        type = 'pwa-node',
        request = 'launch',
        name = 'Launch Current File (Node.js)',
        program = '${file}',
        cwd = '${workspaceFolder}',
      },
      {
        type = 'pwa-node',
        request = 'attach',
        name = 'Attach to Process',
        processId = utils.pick_process,
        cwd = '${workspaceFolder}',
      },
    }

    -- JavaScript (React) reuses the plain JavaScript configurations
    dap.configurations.javascriptreact = dap.configurations.javascript
  end,
}
