return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    -- Set up your custom find_command
    opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
      find_command = { "rg", "--ignore", "--hidden", "--files", "-u" }, -- Custom find command
    })

    -- Custom keymap to use your find_files with the modified find_command
    vim.keymap.set("n", "<leader>ff", function()
      -- Use find_files picker with the custom find_command
      require("telescope.builtin").find_files({
        find_command = { "rg", "--ignore", "--hidden", "--files", "-u" },
      })
    end, { noremap = true, silent = true })

    return opts
  end,
}
