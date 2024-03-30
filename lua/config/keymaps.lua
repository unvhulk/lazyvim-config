-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("t", "jk", "<C-\\><C-n>")
vim.keymap.set({ "i", "n", "v", "t" }, "<C-u>", "<C-u>zz")
vim.keymap.set({ "i", "n", "v", "t" }, "<C-d>", "<C-d>zz")

-- vim.keymap.set("n", "<A-w>", "<leader>bd", { silent = true })
vim.keymap.set({ "i", "n", "v", "t" }, "<A-v>", function()
  require("nvterm.terminal").toggle("vertical")
end)
vim.keymap.set({ "i", "n", "v", "t" }, "<A-h>", function()
  require("nvterm.terminal").toggle("horizontal")
end)
vim.keymap.set({ "i", "n", "v", "t" }, "<A-i>", function()
  require("nvterm.terminal").toggle("float")
end)

vim.keymap.set("n", "<C-n>", "<leader>e")
