return {
  "tummetott/reticle.nvim",
  event = "VeryLazy", -- Adjust as needed for lazy loading
  opts = {
    -- Enable/Disable the cursorline and/or cursorcolumn at startup
    on_startup = {
      cursorline = true, -- Enable cursorline at startup
      cursorcolumn = true, -- Disable cursorcolumn at startup
    },
  },
}
