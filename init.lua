-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.theme-mgr").setup()

vim.opt.clipboard = "unnamedplus"
vim.opt.laststatus = 3
-- Enable word wrap by default
vim.o.wrap = true
--Neovide settings
if vim.g.neovide then
  vim.opt.clipboard = "unnamedplus"
  -- vim.o.guifont = "JetBrainsMono Nerd Font:h12"
  vim.o.guifont = "ProFont IIx Nerd Font Mono:h10"
  vim.g.neovide_opacity = 0.85
  vim.g.neovide_fullscreen = true
end

-- ~/.config/nvim/lua/config/options.lua or any init file
vim.opt.equalalways = false
vim.g.augment_workspace_folders = { "~/dev/azure/am-explorer-v02/" }
