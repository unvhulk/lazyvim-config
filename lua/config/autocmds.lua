-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- Enable relative line numbers for any new buffer or window
vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
  callback = function()
    vim.opt.relativenumber = true
    -- vim.opt.relativenumber = false
  end,
})
