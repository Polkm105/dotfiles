return {
  {
    'stevearc/overseer.nvim',
    --@module 'overseer'
    --@type overseer.SetupOpts
    opts = {},

    keys = {
      {
        '<leader>pp',
        '<cmd>OverseerRun<cr>',
        desc = '[P]roject [P]ick task',
      },
      {
        '<leader>po',
        '<cmd>OverseerToggle<cr>',
        desc = '[P]roject [O]pen runs',
      },
    },
  },
}
