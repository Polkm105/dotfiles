return {
  {
    'stevearc/overseer.nvim',
    --@module 'overseer'
    --@type overseer.SetupOpts
    opts = {},

    keys = {
      {
        '<leader>pp',
        '<cmd>OverseerToggle<cr>',
        desc = '[P]roject toggle settings',
      },
      {
        '<leader>pp',
        '<cmd>OverseerRun<cr>',
        desc = '[P]roject run',
      },
      {
        '<leader>pr',
      },
    },
  },
}
