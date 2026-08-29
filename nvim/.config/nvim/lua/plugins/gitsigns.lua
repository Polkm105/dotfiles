return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
  },
  keys = {
    {
      ']c',
      function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          require('gitsigns').nav_hunk 'next'
        end
      end,
      desc = 'Jump to next git [c]hange',
    },

    {
      '[c',
      function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          require('gitsigns').nav_hunk 'prev'
        end
      end,
      desc = 'Jump to previous git [c]hange',
    },

    -- Gitsigns actions (visual mode)
    {
      '<leader>hs',
      function()
        require('gitsigns').stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end,
      mode = 'v',
      desc = 'git [s]tage hunk',
    },

    {
      '<leader>hr',
      function()
        require('gitsigns').reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end,
      mode = 'v',
      desc = 'git [r]eset hunk',
    },

    -- Gitsigns actions (normal mode)
    {
      '<leader>hs',
      function()
        require('gitsigns').stage_hunk()
      end,
      mode = 'n',
      desc = 'git [s]tage hunk',
    },
    {
      '<leader>hr',
      function()
        require('gitsigns').reset_hunk()
      end,
      desc = 'git [r]eset hunk',
    },
    {
      '<leader>hS',
      function()
        require('gitsigns').stage_buffer()
      end,
      desc = 'git [S]tage buffer',
    },
    {
      '<leader>hR',
      function()
        require('gitsigns').reset_buffer()
      end,
      desc = 'git [R]eset buffer',
    },
    {
      '<leader>hp',
      function()
        require('gitsigns').preview_hunk()
      end,
      desc = 'git [p]review hunk',
    },
    {
      '<leader>hb',
      function()
        require('gitsigns').blame_line()
      end,
      desc = 'git [b]lame line',
    },
    {
      '<leader>hd',
      function()
        require('gitsigns').diffthis()
      end,
      desc = 'git [d]iff against index',
    },
    {
      '<leader>hD',
      function()
        require('gitsigns').diffthis '@'
      end,
      desc = 'git [D]iff against last commit',
    },

    -- Gitsigns toggles
    {
      '<leader>tb',
      function()
        require('gitsigns').toggle_current_line_blame()
      end,
      desc = '[T]oggle git show [b]lame line',
    },
    {
      '<leader>tD',
      function()
        require('gitsigns').preview_hunk_inline()
      end,
      desc = '[T]oggle git show [D]eleted',
    },
  },
}
