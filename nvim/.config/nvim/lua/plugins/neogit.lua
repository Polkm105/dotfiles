return {
  'NeogitOrg/neogit',
  lazy = true,
  dependencies = {
    -- Only one of these is needed.
    'sindrets/diffview.nvim',

    -- For a custom log pager
    'm00qek/baleia.nvim',

    -- Only one of these is needed.
    'nvim-telescope/telescope.nvim',
  },
  cmd = 'Neogit',
  keys = {
    { '<leader>gg', '<cmd>Neogit<cr>', desc = '[G]it [G]UI' },
  },
}
