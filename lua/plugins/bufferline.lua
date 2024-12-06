return {
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
      "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      animation = true,
      insert_at_start = true,
      auto_hide = false, -- Do not hide the tabline when there is only one buffer
      icons = {
        buffer_index = true, -- Show buffer numbers
        filetype = { enabled = true }, -- Show file type icons
      },
      focus_on_close = "left", -- Focus left buffer when a buffer is closed
      clickable = true, -- Enable mouse clicks to select buffers
    },
  },
}
