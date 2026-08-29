return {
  setup = function()
    local dap = require 'dap'
    local dap_utils = require 'dap.utils'

    -- C/C++ debugger configurations
    dap.configurations.cpp = {
      {
        name = 'Launch (CodeLLDB)',
        type = 'codelldb',
        request = 'launch',
        program = function()
          return vim.fn.input(
            'Path to executable: ',
            vim.fn.getcwd() .. '/',
            'file'
          )
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
      },
      {
        name = 'Attach (CodeLLDB)',
        type = 'codelldb',
        request = 'attach',
        processId = dap_utils.pick_process,
        cwd = '${workspaceFolder}',
      },
      {
        name = 'Launch (lldb)',
        type = 'lldb',
        request = 'launch',
        program = function()
          return vim.fn.input(
            'Path to executable: ',
            vim.fn.getcwd() .. '/',
            'file'
          )
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
      },
      {
        name = 'Attach (lldb)',
        type = 'lldb',
        request = 'attach',
        pid = dap_utils.pick_process,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        initCommands = {
          -- 1. Tell LLDB not to stop on SIGILL and pass it directly to the program
          'process handle --pass true --stop false --notify true SIGILL',
        },
      },
      {
        name = 'Launch (gdb)',
        type = 'gdb',
        request = 'launch',
        program = function()
          return vim.fn.input(
            'Path to executable: ',
            vim.fn.getcwd() .. '/',
            'file'
          )
        end,
        cwd = '${workspaceFolder}',
        stopAtBeginningOfMainSubprogram = false,
      },
      {
        name = 'Attach (gdb)',
        type = 'gdb',
        request = 'attach',
        pid = dap_utils.pick_process,
        cwd = '${workspaceFolder}',
      },
      {
        name = 'Attach to port (gdb)',
        type = 'gdb',
        request = 'attach',
        target = function()
          return 'localhost:' .. vim.fn.input('Port: ', '1234')
        end,
        remote = true,
        cwd = '${workspaceFolder}',
      },
    }

    -- C shares the same debugger configurations as C++
    dap.configurations.c = dap.configurations.cpp
  end,
}
