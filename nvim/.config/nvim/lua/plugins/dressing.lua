return {
  'stevearc/dressing.nvim',
  opts = {
    input = {
      title_pos = 'center',
      start_mode = 'normal',

      mappings = {
        n = {
          ['<C-c>'] = 'Close',
        },
      },
    },
    select = {
      backend = { 'telescope' },
      telescope = {
        theme = require('telescope.themes').get_dropdown {
          layout_config = {
            width = 0.85,
            height = 0.75,
          },
        },
      },
    },
  },
}
