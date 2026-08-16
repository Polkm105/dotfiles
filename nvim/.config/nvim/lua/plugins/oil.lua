return {
  'stevearc/oil.nvim',
  -- Disable lazy loading so it can properly hijack directory buffers on startup
  lazy = false,
  dependencies = {
    { 'echasnovski/mini.icons', opts = {} },
  },
  keys = {
    { '-', '<CMD>Oil --float<CR>', desc = 'Open parent directory' },
  },
  opts = {
    -- Your custom oil configurations go here
    default_file_explorer = true,
    view_options = {
      show_hidden = true,
    },
    skip_confirm_for_simple_edits = true,
    float = {
      border = 'rounded',
      padding = 2,
      -- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
      max_width = 0.75,
      max_height = 0.85,

      override = function(conf)
        conf.row = math.floor((vim.o.lines - conf.height) / 2) - 2
        conf.col = math.floor((vim.o.columns - conf.width) / 2) - 1
      end,
    },
  },
}
