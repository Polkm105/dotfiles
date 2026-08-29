local common = require 'config.common'
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
    float = vim.tbl_extend(
      'force',
      common.default_float_style,
      common.float_large
    ),
  },
}
