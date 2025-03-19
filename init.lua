local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
pyright = {
	settings = {
		python = {
			pythonPath = "/usr/bin/python3",
		},
	},
}

require("lazy").setup({
	require("plugins.treesitter"),
	require("plugins.theme"),
	require("plugins.comment"),
	require("plugins.autocompletion"),
	require("plugins.lsp"),
	require("plugins.tree"),
	require("plugins.mason"),
	require("plugins.telescope"),
	require("plugins.harpoon"),
	require("plugins.aerial"),
	require("plugins.bufferline"),
	require("plugins.debug"),
	require("plugins.gitsigns"),
	require("plugins.insert-blankline"),
	require("plugins.misc"),
	require("plugins.none-ls"),
	require("plugins.undo-tree"),
})

vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

vim.keymap.set("i", "<C-h>", "<Left>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-j>", "<Down>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-k>", "<Up>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-l>", "<Right>", { noremap = true, silent = true })

vim.opt.number = true
