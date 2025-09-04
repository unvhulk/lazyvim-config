-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("i", "jk", "<Esc>")
keymap("t", "jk", "<C-\\><C-n>")
keymap({ "i", "n", "v", "t" }, "<C-u>", "<C-u>zz")
keymap({ "i", "n", "v", "t" }, "<C-d>", "<C-d>zz")

-- vim.keymap.set("n", "<A-w>", "<leader>bd", { silent = true })
keymap({ "i", "n", "v", "t" }, "<A-v>", function()
  require("nvterm.terminal").toggle("vertical")
end)
keymap({ "i", "n", "v", "t" }, "<A-b>", function()
  require("nvterm.terminal").toggle("horizontal")
end)
keymap({ "i", "n", "v", "t" }, "<A-i>", function()
  require("nvterm.terminal").toggle("float")
end)

-- Show notifications window
keymap("n", "<Leader>nt", "<cmd>Noice telescope<cr>")
keymap("n", "<leader>nl", "<cmd>Noice last<cr>")
keymap("n", "<leader>nd", "<cmd>Noice dismiss<cr>")
keymap("n", "<leader>nD", "<cmd>Noice disable<cr>")
keymap("n", "<leader>ne", "<cmd>Noice errors<cr>")
keymap("n", "<leader>nE", "<cmd>Noice enable<cr>")
keymap("n", "<leader>ns", "<cmd>Noice stats<cr>")
keymap("n", "<leader>nh", "<cmd>Noice history<cr>")

-- VS CODE KEYMAPS
keymap("n", "<A-J>", "yyp")
keymap("n", "<A-K>", ":call append(line('.')-1, '')<CR>yypgk")
keymap("i", "<C-L>", "<Esc>ea", { noremap = true, silent = true })
keymap("i", "<C-H>", "<Esc>bi", { noremap = true, silent = true })

-- Map Ctrl+Enter to add a new line below the current line and stay in normal mode
keymap("n", "<C-M>", "\n", opts)
keymap("n", "<C-A-a>", "ggVG")
keymap("n", "<Leader>y", "*y")
keymap("n", "<Leader>p", "*p")
keymap("n", "<Enter>", ":call append(line('.'), '')<CR>gj", { silent = true })
keymap("n", "<S-Enter>", ":call append(line('.')-1, '')<CR>gk", { silent = true })

-- Restore default <Enter> behavior in the quickfix list
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.keymap.set("n", "<Enter>", "<CR>", { buffer = true, silent = true })
  end,
})

vim.api.nvim_set_keymap("i", "<C-Y>", "<cmd>call augment#Accept()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-y>", "<cmd>call augment#Accept()<CR>", { noremap = true, silent = true })

--Reopen last closed buffer/file
keymap("n", "<Leader>bh", "<cmd>e#<cr>", opts)

-- Move tabs
keymap("n", "<S-Left>", ":BufferMovePrevious<CR>", opts) -- Shift + Left Arrow for previous buffer
keymap("n", "<S-Right>", ":BufferMoveNext<CR>", opts) -- Shift + Right Arrow for next buffer

-- Cycle through tabs
keymap("n", "H", ":BufferPrevious<CR>", opts)
keymap("n", "L", ":BufferNext<CR>", opts)

keymap("n", "gt", ":BufferPick<CR>", opts) -- Remaps to <leader>b for buffer picking mode
-- Go to specific tab (g + number)
for i = 1, 9 do
  keymap("n", "g" .. i, ":BufferGoto " .. i .. "<CR>", opts)
end

keymap("n", "<leader>ww", function()
  local w = vim.api.nvim_win_get_width(0)
  local h = vim.api.nvim_win_get_height(0)
  local id = vim.api.nvim_get_current_win()
  print("Win ID:", id, "Width:", w, "Height:", h)
end, { desc = "Debug window size" })

-- left aligned fixed size box with left aligned text
keymap({ "n", "v" }, "<Leader>cb", "<Cmd>CBllbox<CR>", opts)
-- centered adapted box
keymap({ "n", "v" }, "<Leader>cB", "<Cmd>CBacbox<CR>", opts)

-- left aligned titled line with left aligned text
keymap({ "n", "v" }, "<Leader>ct", "<Cmd>llline<CR>", opts)

-- centered line
keymap("n", "<Leader>cL", "<Cmd>CBcline<CR>", opts)
keymap("i", "<M-l>", "<Cmd>CBcline<CR>", opts)

-- remove a box or a titled line
keymap({ "n", "v" }, "<Leader>cd", "<Cmd>CBd<CR>", opts)

-- keymaps.lua
keymap("n", "<leader>No", function()
  require("notion").openMenu()
end)

--  Toggle live server
vim.keymap.set("n", "<leader>lt", function()
  require("live-server-nvim").toggle()
end)

vim.keymap.set("n", "<leader>rr", function()
  require("config.cpp_runner").run_cpp()
end, { desc = "Compile and Run C++" })
