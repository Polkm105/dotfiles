return {
  default_float_style = {
    border = 'rounded',
    style = 'minimal',
    padding = 2,
  },
  float_large = {
    -- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    max_width = 0.75,
    max_height = 0.85,

    override = function(conf)
      conf.row = math.floor((vim.o.lines - conf.height) / 2) - 2
      conf.col = math.floor((vim.o.columns - conf.width) / 2) - 1
    end,
  },
}
