local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require('lazy').setup{
	require 'plugins.treesitter',
	require 'plugins.rose-pine',
	require 'plugins.comment',
	require 'plugins.autocompletion',
	require 'plugins.lsp',
}

function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0 , "Normal" , { bg = "none" })
	vim.api.nvim_set_hl(0 , "NormalFloat" , { bg = "none" })
end
ColorMyPencils()

