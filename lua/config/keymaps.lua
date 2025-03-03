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
vim.keymap.set("n", "<Leader>nt", "<cmd>Noice telescope<cr>")
vim.keymap.set("n", "<leader>nl", "<cmd>Noice last<cr>")
vim.keymap.set("n", "<leader>nd", "<cmd>Noice dismiss<cr>")
vim.keymap.set("n", "<leader>nD", "<cmd>Noice disable<cr>")
vim.keymap.set("n", "<leader>ne", "<cmd>Noice errors<cr>")
vim.keymap.set("n", "<leader>nE", "<cmd>Noice enable<cr>")
vim.keymap.set("n", "<leader>ns", "<cmd>Noice stats<cr>")
vim.keymap.set("n", "<leader>nh", "<cmd>Noice history<cr>")

-- VS CODE KEYMAPS
vim.keymap.set("n", "<A-J>", "yyp")
vim.keymap.set("n", "<A-K>", "yyp")
vim.keymap.set("i", "<C-L>", "<Esc>ea", { noremap = true, silent = true })
vim.keymap.set("i", "<C-H>", "<Esc>bi", { noremap = true, silent = true })

-- Map Ctrl+Enter to add a new line below the current line and stay in normal mode
vim.keymap.set("n", "<C-M>", "\n", opts)
vim.keymap.set("n", "<C-A-a>", "ggVG")
vim.keymap.set("n", "<C-A-a>", "ggVG")
vim.keymap.set("n", "<Leader>y", "*y")
vim.keymap.set("n", "<Leader>p", "*p")
vim.keymap.set("n", "<Enter>", ":call append(line('.'), '')<CR>gj", { silent = true })
vim.keymap.set("n", "<S-Enter>", ":call append(line('.')-1, '')<CR>gk", { silent = true })

--Reopen last closed buffer/file
vim.keymap.set("n", "<Leader>bh", "<cmd>e#<cr>", opts)

-- Move tabs
vim.keymap.set("n", "<S-Left>", ":BufferMovePrevious<CR>", opts) -- Shift + Left Arrow for previous buffer
vim.keymap.set("n", "<S-Right>", ":BufferMoveNext<CR>", opts) -- Shift + Right Arrow for next buffer

-- Restore default <Enter> behavior in the quickfix list
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.keymap.set("n", "<Enter>", "<CR>", { buffer = true, silent = true })
  end,
})

-- Cycle through tabs
vim.keymap.set("n", "H", ":BufferPrevious<CR>", opts)
vim.keymap.set("n", "L", ":BufferNext<CR>", opts)

vim.keymap.set("n", "gt", ":BufferPick<CR>", opts) -- Remaps to <leader>b for buffer picking mode
-- Go to specific tab (g + number)
for i = 1, 9 do
  vim.keymap.set("n", "g" .. i, ":BufferGoto " .. i .. "<CR>", opts)
end

-- ChatGPT keymaps
-- vim.api.nvim_set_keymap("n", "<leader>acc", ":ChatGPT<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("v", "<leader>aee", ":ChatGPTEditWithInstructions<CR>", { noremap = true, silent = true })
