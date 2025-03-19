-- fuzzy finder (files, lsp, etc)
return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    'nvim-telescope/telescope-ui-select.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local telescope = require 'telescope'
    local actions = require 'telescope.actions'
    local builtin = require 'telescope.builtin'

    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<c-k>'] = actions.move_selection_previous, -- move to prev result
            ['<c-j>'] = actions.move_selection_next,     -- move to next result
            ['<c-l>'] = actions.select_default,          -- open file
          },
          n = {
            ['q'] = actions.close,
          },
        },
      },
      pickers = {
        find_files = {
          file_ignore_patterns = { 'node_modules', '.git', '.venv' },
          hidden = true,
        },
        buffers = {
          initial_mode = 'normal',
          sort_lastused = true,
          -- sort_mru = true,
          mappings = {
            n = {
              ['d'] = actions.delete_buffer,
              ['l'] = actions.select_default,
            },
          },
        },
      },
      live_grep = {
        file_ignore_patterns = { 'node_modules', '.git', '.venv' },
        additional_args = function(_)
          return { '--hidden' }
        end,
      },
      path_display = {
        filename_first = {
          reverse_directories = true,
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
      git_files = {
        previewer = false,
      },
    }

    -- enable telescope fzf native, if installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    -- vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[s]earch existing [b]uffers' })
    vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'search [g]it [f]iles' })
    vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'search [g]it [c]ommits' })
    vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = 'search [g]it [b]ranches' })

    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[f]ind [f]iles' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[s]earch current [w]ord' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[s]earch by [g]rep' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[s]earch [d]iagnostics' })
    vim.keymap.set('n', '<leader>ss', function()
      builtin.lsp_document_symbols {
        symbols = { 'class', 'function', 'method', 'constructor', 'interface', 'module', 'property' },
      }
    end, { desc = '[s]each lsp document [s]ymbols' })

    vim.keymap.set('n', '<leader>fw', builtin.current_buffer_fuzzy_find, { desc = '[f]uzzy search in current [w]indow' })
  end,
}
