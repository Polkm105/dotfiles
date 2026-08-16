local dap = require 'dap'
local dapui = require 'dapui'
local utils = require 'dap.utils'

-- Set logging levels to debug why adapters are not working
-- logs are saved in ~.cache/nvim/dap.log.
dap.set_log_level 'DEBUG'

-- 2. Define the adapter using node to run the JS server
dap.adapters['pwa-node'] = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'js-debug-adapter',
    args = { '${port}' },
  },
}

-- 3. Define configurations for JavaScript
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

dap.configurations.javascriptreact = dap.configurations.javascript
