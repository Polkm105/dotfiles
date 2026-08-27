vim.keymap.set('n', 'K', function()
  vim.cmd.RustLsp { 'hover', 'actions' }
end, { silent = true, buffer = vim.api.nvim_get_current_buf() })

vim.keymap.set('n', '<leader>pd', function()
  vim.cmd.RustCheck()
end, { desc = '[P]roject compile [D]ebug' })

vim.keymap.set('n', '<leader>pD', function()
  vim.cmd.RustLsp 'debuggables'
end, { desc = '[P]roject run [D]ebug' })

vim.keymap.set('n', '<leader>pr', function()
  vim.cmd.RustRun()
end, { desc = '[P]roject compile [R]elease' })

vim.keymap.set('n', '<leader>pR', function()
  vim.cmd.RustLsp 'run'
end, { desc = '[P]roject run [R]elease' })

vim.keymap.set('n', '<leader>pt', function()
  vim.cmd '!cargo test'
end, { desc = '[P]roject compile [T]est', silent = true })

vim.keymap.set('n', '<leader>pT', function()
  vim.cmd '!cargo test'
end, { desc = '[P]roject run [T]est', silent = true })

-- vim.api.nvim_create_autocmd('LspAttach', {
--   group = vim.api.nvim_create_augroup('RustDiagnostics', {}),
--   callback = function(args)
--     local bufnr = args.buf
--     vim.api.nvim_create_autocmd('BufWritePost', {
--       buffer = bufnr,
--       callback = function()
--         vim.diagnostic.setqflist { open = false }
--       end,
--     })
--   end,
-- })
