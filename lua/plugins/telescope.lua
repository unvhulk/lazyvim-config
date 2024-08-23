return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
      find_command = {
        "rg",
        "--ignore",
        "--hidden",
        "--files",
        "-u",
        "--glob",
        "!*/node_modules/*", -- Exclude node_modules from search
      },
    })

    -- Custom keymap to use the modified find_files command
    vim.keymap.set("n", "<leader>ff", function()
      require("telescope.builtin").find_files({
        find_command = {
          "rg",
          "--ignore",
          "--hidden",
          "--files",
          "-u",
          "--glob",
          "!*/node_modules/*", -- Exclude node_modules
        },
      })
    end, { noremap = true, silent = true })

    return opts
  end,
}
