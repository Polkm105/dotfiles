return {
  'mrjones2014/legendary.nvim',

  priority = 10000,
  lazy = false,
  opts = {
    extensions = {
      lazy_nvim = true,
      diffview = true,
    },
  },
  keys = {
    { '<leader>sk', '<cmd>Legendary<cr>', desc = '[S]earch [K]eymaps' },
    { '<leader>sc', '<cmd>Legendary<cr>', desc = '[S]earch [K]eymaps' },
  },
}
