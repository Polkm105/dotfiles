return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-live-grep-args.nvim', version = '^1.0.0' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  opts = {
    defaults = {
      sorting = false,
      file_ignore_patterns = {
        '.git/',
        'target/',
        'node_modules/',
        'dist/',
        'build/',
      },
      mappings = {
        n = {
          ['<C-c>'] = require('telescope.actions').close,
        },
        i = {
          ['<C-c>'] = require('telescope.actions').close,
        },
      },
    },
    extensions = {
      ['ui-select'] = {
        require('telescope.themes').get_dropdown(),
      },
      live_grep_args = {
        auto_quoting = true,
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
        },
      },
    },
  },
  config = function(_, opts)
    require('telescope').setup(opts)

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
    pcall(require('telescope').load_extension, 'live_grep_args')
  end,
  keys = {
    { '<leader>sh', '<cmd>Telescope help_tags<cr>', desc = '[S]earch [H]elp' },
    {
      '<leader>sf',
      '<cmd>Telescope find_files<cr>',
      desc = '[S]earch [F]iles',
    },
    {
      '<leader>sw',
      '<cmd>Telescope grep_string<cr>',
      desc = '[S]earch current [W]ord',
    },
    {
      '<leader>sd',
      '<cmd>Telescope diagnostics<cr>',
      desc = '[S]earch [D]iagnostics',
    },
    { '<leader>sr', '<cmd>Telescope resume<cr>', desc = '[S]earch [R]esume' },
    {
      '<leader>s.',
      '<cmd>Telescope oldfiles<cr>',
      desc = '[S]earch [.] Recent Files',
    },
    {
      '<leader><leader>',
      '<cmd>Telescope buffers<cr>',
      desc = '[ ] Find existing buffers',
    },
    {
      '<leader>sg',
      function()
        require('telescope').extensions.live_grep_args.live_grep_args()
      end,
      desc = '[S]earch by [G]rep',
    },
    {
      '<leader>/',
      function()
        require('telescope.builtin').current_buffer_fuzzy_find(
          require('telescope.themes').get_dropdown {
            winblend = 10,
            previewer = false,
          }
        )
      end,
      desc = '[/] Fuzzily search in current buffer',
    },
    {
      '<leader>s/',
      function()
        require('telescope').extensions.live_grep_args.live_grep_args {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end,
      desc = '[S]earch [/] in Open Files',
    },
    {
      '<leader>sn',
      function()
        require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = '[S]earch [N]eovim files',
    },
  },
}
