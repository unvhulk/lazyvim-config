-- ~/.config/nvim/lua/plugins/zk.lua
return {
  {
    "zk-org/zk-nvim",
    config = function()
      require("zk").setup({
        picker = "telescope",
        lsp = {
          config = {
            cmd = { "zk", "lsp" },
            name = "zk",
          },
          auto_attach = {
            enabled = true,
            filetypes = { "markdown" },
          },
        },
      })
    end,
  },

  -- Key mappings
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>z", group = "zk" },
        { "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", desc = "New note" },
        { "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", desc = "Open notes" },
        { "<leader>zt", "<Cmd>ZkTags<CR>", desc = "Browse tags" },
        { "<leader>zf", "<Cmd>ZkNotes { match = { vim.fn.input('Search: ') } }<CR>", desc = "Find notes" },
        { "<leader>zb", "<Cmd>ZkBacklinks<CR>", desc = "Show backlinks" },
        { "<leader>zl", "<Cmd>ZkLinks<CR>", desc = "Show links" },
        { "<leader>zi", "<Cmd>ZkInsertLink<CR>", desc = "Insert link", mode = { "n", "v" } },
        -- Add tech word to dictionary when on it
        { "zg", desc = "Add word to dictionary" },
        { "zw", desc = "Mark word as misspelled" },
      },
    },
  },
}
