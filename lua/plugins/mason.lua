return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					border = "rounded", -- Możesz zmienić na inne style, jeśli chcesz.
				},
				install_root_dir = vim.fn.stdpath("data") .. "/mason", -- Określenie katalogu, gdzie mason przechowuje zainstalowane narzędzia
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright" }, -- LSPs, które mają być zainstalowane
				automatic_installation = true, -- Automatyczna instalacja LSPs
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = { "lua-language-server", "stylua", "prettier" }, -- Narzędzia do zainstalowania
				auto_update = true, -- Automatyczna aktualizacja narzędzi
				run_on_start = true, -- Uruchamianie instalacji po starcie
			})
		end,
	},
}
