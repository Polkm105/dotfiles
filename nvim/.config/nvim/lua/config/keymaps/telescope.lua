vim.keymap.set(
  'n',
  '<leader>sh',
  require('telescope.builtin').help_tags,
  { desc = '[S]earch [H]elp' }
)
vim.keymap.set(
  'n',
  '<leader>sk',
  require('telescope.builtin').keymaps,
  { desc = '[S]earch [K]eymaps' }
)
vim.keymap.set(
  'n',
  '<leader>sf',
  require('telescope.builtin').find_files,
  { desc = '[S]earch [F]iles' }
)
vim.keymap.set(
  'n',
  '<leader>ss',
  require('telescope.builtin').builtin,
  { desc = '[S]earch [S]elect Telescope' }
)
vim.keymap.set(
  'n',
  '<leader>sw',
  require('telescope.builtin').grep_string,
  { desc = '[S]earch current [W]ord' }
)
vim.keymap.set(
  'n',
  '<leader>sg',
  require('telescope').extensions.live_grep_args.live_grep_args,
  { desc = '[S]earch by [G]rep' }
)
vim.keymap.set(
  'n',
  '<leader>sd',
  require('telescope.builtin').diagnostics,
  { desc = '[S]earch [D]iagnostics' }
)
vim.keymap.set(
  'n',
  '<leader>sr',
  require('telescope.builtin').resume,
  { desc = '[S]earch [R]esume' }
)
vim.keymap.set(
  'n',
  '<leader>s.',
  require('telescope.builtin').oldfiles,
  { desc = '[S]earch Recent Files ("." for repeat)' }
)
vim.keymap.set(
  'n',
  '<leader><leader>',
  require('telescope.builtin').buffers,
  { desc = '[ ] Find existing buffers' }
)

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to Telescope to change the theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(
    require('telescope.themes').get_dropdown {
      winblend = 10,
      previewer = false,
    }
  )
end, { desc = '[/] Fuzzily search in current buffer' })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set('n', '<leader>s/', function()
  require('telescope.builtin').live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = '[S]earch [/] in Open Files' })

-- Shortcut for searching your Neovim configuration files
vim.keymap.set('n', '<leader>sn', function()
  require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files' })
