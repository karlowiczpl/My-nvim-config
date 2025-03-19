return {
  'numToStr/Comment.nvim',
  opts = {},
  config = function()
    require('Comment').setup()

    local opts = { noremap = true, silent = true }

    -- Normal mode: komentowanie pojedynczej linii
    vim.keymap.set('n', '<leader>/', require('Comment.api').toggle.linewise.current, opts)

    vim.keymap.set('v', '<leader>/', "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", opts)
  end,
}

