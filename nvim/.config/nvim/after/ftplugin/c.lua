vim.cmd 'runtime! after/ftplugin/cpp.lua'

local dap = require 'dap'

dap.configurations.c = dap.configurations.cpp
