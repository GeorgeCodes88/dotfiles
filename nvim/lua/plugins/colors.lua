return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = {
      terminal_colors = true,
      transparent_mode = true, -- Preserves your Kitty background transparency!
      palette_overrides = {
        dark0_hard = "#1d2021", -- Matches your extra-dark background
      },
    },
    config = function(_, opts)
      require("gruvbox").setup(opts)
      vim.cmd.colorscheme("gruvbox")
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      options = {
        theme = "gruvbox",
      },
    },
  },
}
