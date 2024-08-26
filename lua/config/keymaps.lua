-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local opts = { noremap = true, silent = true }

vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("t", "jk", "<C-\\><C-n>")
vim.keymap.set({ "i", "n", "v", "t" }, "<C-u>", "<C-u>zz")
vim.keymap.set({ "i", "n", "v", "t" }, "<C-d>", "<C-d>zz")

-- vim.keymap.set("n", "<A-w>", "<leader>bd", { silent = true })
vim.keymap.set({ "i", "n", "v", "t" }, "<A-v>", function()
  require("nvterm.terminal").toggle("vertical")
end)
vim.keymap.set({ "i", "n", "v", "t" }, "<A-b>", function()
  require("nvterm.terminal").toggle("horizontal")
end)
vim.keymap.set({ "i", "n", "v", "t" }, "<A-i>", function()
  require("nvterm.terminal").toggle("float")
end)

-- Show notifications window
vim.keymap.set("n", "<Leader>n", "<cmd>Noice<cr>")

-- VS CODE KEYMAPS
vim.keymap.set("n", "<A-J>", "yyp")
vim.keymap.set("n", "<A-K>", "yyp")

-- Map Ctrl+Enter to add a new line below the current line and stay in normal mode
vim.keymap.set("n", "<C-M>", "o<Esc>", opts)
vim.keymap.set("n", "<C-A-a>", "ggVG")
vim.keymap.set("n", "<C-A-a>", "ggVG")
vim.keymap.set("n", "<Leader>y", "*y")
vim.keymap.set("n", "<Leader>p", "*p")

--Reopen last closed buffer/file
vim.keymap.set("n", "<Leader>bh", "<cmd>e#<cr>", opts)

-- Move tabs
vim.keymap.set("n", "<S-Left>", ":BufferMovePrevious<CR>", opts) -- Shift + Left Arrow for previous buffer
vim.keymap.set("n", "<S-Right>", ":BufferMoveNext<CR>", opts) -- Shift + Right Arrow for next buffer

-- Cycle through tabs
vim.keymap.set("n", "H", ":BufferPrevious<CR>", opts)
vim.keymap.set("n", "L", ":BufferNext<CR>", opts)

-- Go to specific tab (Ctrl + index)
for i = 1, 9 do
  vim.keymap.set("n", "<C-" .. i .. ">", ":BufferGoto " .. (i - 1) .. "<CR>", opts)
end
