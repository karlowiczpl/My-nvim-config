return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons", 
  },
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 30, 
        side = "left", 
      },
      renderer = {
        highlight_opened_files = "all",
        icons = {
          show = {
            git = true,
            file = true,
            folder = true,
            folder_arrow = true,
          },
        },
      },
      update_focused_file = {
        enable = true,
      },
      filters = {
        dotfiles = false, 
      },
      git = {
        enable = true,
        ignore = false, 
      },
    })

    vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
  end,
}

