return {
  'numToStr/Comment.nvim',
  opts = {},
  config = function()
    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<leader>/', require('Comment.api').toggle.linewise.current, opts)
  end,
}
