return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  {
    'sindrets/diffview.nvim',
    config = function() end,
  },
  {
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
  },
}
