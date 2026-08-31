-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup(
    'kickstart-highlight-yank',
    { clear = true }
  ),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Make floating windows have borders by default
-- vim.api.nvim_create_autocmd('WinEnter', {
--   callback = function()
--     local common = require 'config.common'
--     local win = vim.api.nvim_get_current_win()
--     local config = vim.api.nvim_win_get_config(win)
--
--     -- Check if win is floating
--     if config.relative ~= '' then
--       vim.tbl_extend('force', config, common.default_float_style)
--       vim.api.nvim_win_set_config(win, config)
--     end
--   end,
-- })
