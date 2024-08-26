-- Add this in your plugins list
return {
  "romgrk/barbar.nvim",
  requires = "lewis6991/gitsigns.nvim", -- Optional, for git signs integration

  config = function()
    require("barbar").setup({
      icons = {
        diagnostics = {
          [vim.diagnostic.severity.ERROR] = { enabled = true },
          [vim.diagnostic.severity.WARN] = { enabled = true },
          [vim.diagnostic.severity.INFO] = { enabled = true },
          [vim.diagnostic.severity.HINT] = { enabled = true },
        },
        separator = { left = "", right = "" },
        modified = { symbol = "●" },
        inactive = { icon = "▏" },
        -- Index display settings
        numbers = "default", -- Change to "both" or "default" if you want to show both numbers and icons
      },
      -- Additional options if needed
    })
  end,
}
