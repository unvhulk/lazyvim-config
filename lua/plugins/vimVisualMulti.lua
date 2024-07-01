return {
  -- Other plugins here

  {
    "mg979/vim-visual-multi",
    branch = "master",
    keys = {
      -- Define your key mappings for Visual Multi
      { "<C-N>", "<Plug>(VM-Find-Under)", desc = "Find Under" },
      { "<C-D>", "<Plug>(VM-Select-All)", desc = "Select All" },
      { "<M-J>", "<Plug>(VM-Add-Cursor-Down)", desc = "Add Cursor Down" },
      { "<M-K>", "<Plug>(VM-Add-Cursor-Up)", desc = "Add Cursor Up" },
    },
    config = function()
      -- Optional: Add any specific configuration for Visual Multi here
      vim.g.VM_maps = {
        ["Find Under"] = "<C-N>",
        ["Find Subword Under"] = "<C-N>",
        ["Select All"] = "<C-D>",
        ["Add Cursor Down"] = "<M-J>",
        ["Add Cursor Up"] = "<M-K>",
      }
    end,
  },
}
