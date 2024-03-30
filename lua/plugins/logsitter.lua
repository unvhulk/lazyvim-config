return {
  {
    "0x100101/lab.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("lab").setup({
        code_runner = {
          enabled = true,
        },
        quick_data = {
          enabled = false,
        },
      })
      -- Any additional configuration can go here
      -- For example, if you need to configure lab.nvim after loading
    end,
  },
}
