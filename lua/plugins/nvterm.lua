return {
  {
    "NvChad/nvterm",
    config = function()
      require("nvterm").setup({
        terminals = {
          shell = vim.o.shell,
          list = {},
          type_opts = {
            float = {
              relative = "editor",
              row = 0.2,
              col = 0.15,
              width = 0.7,
              height = 0.5,
              border = "single",
            },
            horizontal = { location = "rightbelow", split_ratio = 0.5 },
            vertical = { location = "rightbelow", split_ratio = 0.5 },
          },
        },
        behavior = {
          autoclose_on_quit = {
            enabled = false,
            confirm = true,
          },
          close_on_exit = true,
          auto_insert = false,
        },
      })
    end,
  },
}
