-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set(
  'n',
  '<leader>q',
  vim.diagnostic.setloclist,
  { desc = 'Open diagnostic [Q]uickfix list' }
)

vim.keymap.set('n', 'gC', '<cmd>tabclose<CR>', { desc = 'Tab [C]lose' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set(
  't',
  '<Esc><Esc>',
  '<C-\\><C-n>',
  { desc = 'Exit terminal mode' }
)

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set(
  'n',
  '<C-h>',
  '<C-w><C-h>',
  { desc = 'Move focus to the left window' }
)
vim.keymap.set(
  'n',
  '<C-l>',
  '<C-w><C-l>',
  { desc = 'Move focus to the right window' }
)
vim.keymap.set(
  'n',
  '<C-j>',
  '<C-w><C-j>',
  { desc = 'Move focus to the lower window' }
)
vim.keymap.set(
  'n',
  '<C-k>',
  '<C-w><C-k>',
  { desc = 'Move focus to the upper window' }
)

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

local function run_project()
  local cmd_args = {}
  local input = vim.fn.input 'Executable with args: '

  for word in string.gmatch(input, '%S+') do
    table.insert(cmd_args, word)
  end

  if #cmd_args > 0 then
    vim.fn.jobstart(cmd_args, {
      on_exit = function(_, exit_code)
        print('\nJob finished with code: ' .. exit_code)
      end,
    })
  else
    print '\nInvalid executable args'
  end
end

vim.keymap.set(
  'n',
  '<leader>pd',
  vim.g.project_build_debug,
  { buffer = true, desc = '[P]roject build [D]ebug' }
)
vim.keymap.set('n', '<leader>pD', function()
  local dap = require 'dap'
  vim.g.project_build_debug()
  local run = vim.g.run_debug or dap.continue
  run()
end, { buffer = true, desc = '[P]roject run [D]ebug' })

vim.keymap.set(
  'n',
  '<leader>pr',
  vim.g.project_build_release,
  { buffer = true, desc = '[P]roject build [r]elease' }
)
vim.keymap.set('n', '<leader>pR', function()
  vim.g.project_build_release()
  local run = vim.g.run_release or run_project
  run()
end, { buffer = true, desc = '[P]roject run [R]elease' })

vim.keymap.set(
  'n',
  '<leader>pt',
  vim.g.project_build_release,
  { buffer = true, desc = '[P]roject build [t]ests' }
)
vim.keymap.set('n', '<leader>pT', function()
  vim.g.project_build_tests()
  local run = vim.g.run_tests or run_project
  run()
end, { buffer = true, desc = '[P]roject run [T]ests' })

vim.keymap.set(
  'n',
  '<leader>cf',
  vim.g.project_build_file,
  { buffer = true, desc = '[C]ompile [F]ile' }
)
