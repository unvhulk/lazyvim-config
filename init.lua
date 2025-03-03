-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- lua

vim.opt.clipboard = "unnamedplus"
-- Enable word wrap by default
-- vim.o.wrap = true

-- Neovide settings
if vim.g.neovide then
  vim.opt.clipboard = "unnamedplus"
  vim.o.guifont = "JetBrainsMono Nerd Font:h12"
  vim.g.neovide_transparency = 0.8
  vim.g.neovide_fullscreen = true
end

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local cb = require("comment-box")

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

-- local animate = require("mini.animate")
-- animate.setup({
--   scroll = {
--     timing = animate.gen_timing.linear({ duration = 50, unit = "total" }),
--   },
-- })
