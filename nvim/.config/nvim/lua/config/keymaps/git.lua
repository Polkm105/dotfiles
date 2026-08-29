-- Git keymaps (gitsigns, neogit, diffview)

-- Gitsigns navigation
vim.keymap.set('n', ']c', function()
  if vim.wo.diff then
    vim.cmd.normal { ']c', bang = true }
  else
    require('gitsigns').nav_hunk 'next'
  end
end, { desc = 'Jump to next git [c]hange' })

vim.keymap.set('n', '[c', function()
  if vim.wo.diff then
    vim.cmd.normal { '[c', bang = true }
  else
    require('gitsigns').nav_hunk 'prev'
  end
end, { desc = 'Jump to previous git [c]hange' })

-- Gitsigns actions (visual mode)
vim.keymap.set('v', '<leader>hs', function()
  require('gitsigns').stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
end, { desc = 'git [s]tage hunk' })
vim.keymap.set('v', '<leader>hr', function()
  require('gitsigns').reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
end, { desc = 'git [r]eset hunk' })

-- Gitsigns actions (normal mode)
vim.keymap.set(
  'n',
  '<leader>hs',
  function()
    require('gitsigns').stage_hunk()
  end,
  { desc = 'git [s]tage hunk' }
)
vim.keymap.set(
  'n',
  '<leader>hr',
  function()
    require('gitsigns').reset_hunk()
  end,
  { desc = 'git [r]eset hunk' }
)
vim.keymap.set(
  'n',
  '<leader>hS',
  function()
    require('gitsigns').stage_buffer()
  end,
  { desc = 'git [S]tage buffer' }
)
vim.keymap.set(
  'n',
  '<leader>hu',
  function()
    require('gitsigns').undo_stage_hunk()
  end,
  { desc = 'git [u]ndo stage hunk' }
)
vim.keymap.set(
  'n',
  '<leader>hR',
  function()
    require('gitsigns').reset_buffer()
  end,
  { desc = 'git [R]eset buffer' }
)
vim.keymap.set(
  'n',
  '<leader>hp',
  function()
    require('gitsigns').preview_hunk()
  end,
  { desc = 'git [p]review hunk' }
)
vim.keymap.set(
  'n',
  '<leader>hb',
  function()
    require('gitsigns').blame_line()
  end,
  { desc = 'git [b]lame line' }
)
vim.keymap.set(
  'n',
  '<leader>hd',
  function()
    require('gitsigns').diffthis()
  end,
  { desc = 'git [d]iff against index' }
)
vim.keymap.set('n', '<leader>hD', function()
  require('gitsigns').diffthis '@'
end, { desc = 'git [D]iff against last commit' })

-- Gitsigns toggles
vim.keymap.set(
  'n',
  '<leader>tb',
  function()
    require('gitsigns').toggle_current_line_blame()
  end,
  { desc = '[T]oggle git show [b]lame line' }
)
vim.keymap.set(
  'n',
  '<leader>tD',
  function()
    require('gitsigns').preview_hunk_inline()
  end,
  { desc = '[T]oggle git show [D]eleted' }
)

-- Diffview keymap
vim.keymap.set('n', '<leader>gd', '<cmd>:DiffviewOpen<cr>', { desc = '[G]it [D]iff view' })

-- Neogit keymap
vim.keymap.set('n', '<leader>gg', '<cmd>Neogit<cr>', { desc = '[G]it [G]UI' })
