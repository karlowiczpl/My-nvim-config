return {
	"mbbill/undotree",
	event = "VeryLazy", -- Załaduj wtyczkę, kiedy będzie to konieczne (na przykład przy otwieraniu pliku)
	config = function()
		-- Ustawienia dla undo-tree
		vim.g.undotree_SetFocusWhenOpen = 1 -- Ustaw, żeby okno undo-tree miało fokus po otwarciu
		vim.g.undotree_WindowLayout = 3 -- Okno w trybie 'horizontal' (inny wybór: 1, 2, 3, 4)
		vim.g.undotree_ShortIndicators = 1 -- Włącz krótkie wskaźniki zmian (np. `+`, `-`, `~`)
		vim.g.undotree_TreeWidth = 40 -- Szerokość drzewa undo (można dostosować według potrzeb)
		vim.g.undotree_ShowDiffs = 1 -- Pokaż zmiany w drzewie (zmiany wprowadzone w bieżącej sesji)
		vim.g.undotree_HelpLine = 1 -- Pokaż linię pomocy w oknie undo-tree

		-- Mapowanie klawiszy
		vim.api.nvim_set_keymap(
			"n",
			"<leader>u",
			":UndotreeToggle<CR>",
			{ noremap = true, silent = true, desc = "Toggle Undo Tree" }
		)
	end,
}
