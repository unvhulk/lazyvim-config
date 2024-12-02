-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.clipboard = "unnamedplus"
-- Enable word wrap by default
-- vim.o.wrap = true

-- Neovide settings
if vim.g.neovide then
  vim.opt.clipboard = "unnamedplus"
  vim.o.guifont = "JetBrainsMono Nerd Font:h14"
  vim.g.neovide_transparency = 0.5
  vim.g.neovide_fullscreen = true
end
