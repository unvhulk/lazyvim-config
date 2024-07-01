return {
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   lazy = false,
  --   priority = 1000,
  --   transparent = true,
  --   config = function()
  --     require("catppuccin").setup({
  --       flavour = "macchiato", -- latte, frappe, macchiato, mocha
  --       transparent = true,
  --     })
  --     -- setup must be called before loading
  --     vim.cmd.colorscheme("catppuccin")
  --   end,
  -- },
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
