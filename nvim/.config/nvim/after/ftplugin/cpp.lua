local dap = require 'dap'
local dap_utils = require 'dap.utils'

dap.configurations.cpp = {
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

vim.g.project_build_debug = function()
  vim.cmd 'make debug'
end
vim.g.project_run_debug = function()
  dap.run {
    name = 'Launch (lldb)',
    type = 'lldb',
    request = 'launch',
    program = vim.g.debug_executable,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  }
end

vim.g.project_build_release = function()
  vim.cmd 'make release'
end
vim.g.project_run_release = function()
  vim.cmd 'make run release'
end

vim.g.project_build_tests = function()
  vim.cmd 'make tests'
end
vim.g.project_run_tests = function()
  vim.cmd 'make run tests'
end

vim.g.project_build_file = function()
  vim.cmd 'make -c % -o %:r.o<CR>'
end
