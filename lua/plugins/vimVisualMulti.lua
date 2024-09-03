return {
  -- Other plugins here

  {
    "mg979/vim-visual-multi",
    branch = "master",
    config = function()
      -- Optional: Add any specific configuration for Visual Multi here
      vim.g.VM_maps = {
        ["Find Under"] = "<C-N>",
        ["Find Subword Under"] = "<C-N>",
        ["Select All"] = "<C-D>",
        -- q to skip next occurance of the word
      }
    end,
  },
}
