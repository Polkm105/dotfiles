return {
  'stevearc/dressing.nvim',
  opts = {
    input = {
      enabled = false,
    },
    select = {
      enabled = true,
      backend = { 'telescope' },
      telescope = require('telescope.themes').get_dropdown {
        layout_strategy = 'horizontal',
        sorting_strategy = 'descending',
        -- Define explicit rounded borders for every sub-panel component
        borderchars = {
          -- Main layout container fallback border
          { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
          -- Prompt block container (Explicitly round all 4 corners)
          prompt = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
          -- Results block container (Explicitly round all 4 corners)
          results = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
          -- Preview block container fallback
          preview = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        },

        layout_config = {
          width = 0.85,
          height = 0.75,
          prompt_position = 'bottom',
        },
      },
    },
  },
}
