return {
  "augmentcode/augment.vim",
  config = function()
    vim.g.augment_workspace_folders = {
      -- Add your project folders here
      "/home/udaynv/dev/azure/am-explorer-v02/",
      "/home/udaynv/dev/azure/am-explorer/",
    }

    local map = vim.keymap.set
    local opts = { desc = "", silent = true }

    -- Status & Auth
    map("n", "<leader>acs", ":Augment status<CR>", { desc = "Augment Status" })
    map("n", "<leader>aci", ":Augment signin<CR>", { desc = "Augment Signin" })
    map("n", "<leader>aco", ":Augment signout<CR>", { desc = "Augment Signout" })
    map("n", "<leader>acl", ":Augment log<CR>", { desc = "Augment Log" })

    -- Chat-related commands
    map("n", "<leader>acc", ":Augment chat<CR>", { desc = "Augment Chat" })
    map("n", "<leader>acn", ":Augment chat-new<CR>", { desc = "Augment New Chat" })
    map("n", "<leader>act", ":Augment chat-toggle<CR>", { desc = "Augment Toggle Chat Panel" })
  end,
}
