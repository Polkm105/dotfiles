-- Diagnostic keymaps
vim.keymap.set(
  'n',
  '<leader>q',
  vim.diagnostic.setloclist,
  { desc = 'Open diagnostic [Q]uickfix list' }
)

-- Tab close keymap
vim.keymap.set('n', 'gC', '<cmd>tabclose<CR>', { desc = 'Tab [C]lose' })
