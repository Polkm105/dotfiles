return {
  {
    'mrcjkb/rustaceanvim',
    version = '^9', -- Recommended
    lazy = false, -- This plugin is already lazy
  },
  {
    'saecki/crates.nvim',
    event = { 'BufRead Cargo.toml' },
    ft = { 'toml' },
    opts = {
      completion = {
        crates = { enabled = true },
        cmp = { enabled = true },
      },
      lsp = {
        enabled = true,
        actions = true,
        completion = true,
        hover = true,
      },
    },
  },
}
