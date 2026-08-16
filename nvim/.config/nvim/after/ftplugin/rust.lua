vim.keymap.set(
  'n',
  'K', -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
  function()
    vim.cmd.RustLsp { 'hover', 'actions' }
  end,
  { silent = true, buffer = vim.api.nvim_get_current_buf() }
)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('RustDiagnostics', {}),
  callback = function(args)
    local bufnr = args.buf
    vim.api.nvim_create_autocmd('BufWritePost', {
      buffer = bufnr,
      callback = function()
        vim.diagnostic.setqflist { open = false }
      end,
    })
  end,
})
