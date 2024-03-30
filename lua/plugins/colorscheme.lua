return {
  -- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      style = "night",
      styles = { sidebars = "dark" },
      sidebars = { "qf", "help", "terminal" },
    },
  },
}
