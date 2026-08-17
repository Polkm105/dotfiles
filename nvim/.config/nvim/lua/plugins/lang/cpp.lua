vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('CppBuildCommands', { clear = true }),
  pattern = { 'c', 'cpp' },
  callback = function()
    vim.cmd 'compiler gcc'

    vim.bomakeprg = 'make'
    vim.keymap.set(
      'n',
      '<leader>cb',
      '<cmd>make all<CR>',
      { buffer = true, desc = '[C]ompile and [B]uild' }
    )
    vim.keymap.set(
      'n',
      '<leader>cp',
      '<cmd>make<CR>',
      { buffer = true, desc = '[C]ompile [P]roject' }
    )
    vim.keymap.set(
      'n',
      '<leader>cf',
      '<cmd>make -c % -o %:r.o<CR>',
      { buffer = true, desc = '[C]ompile [F]ile' }
    )
  end,
})

return {}
