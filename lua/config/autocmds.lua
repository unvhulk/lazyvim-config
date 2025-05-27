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

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
  callback = function()
    local macro = [[yiwoconsole.log("]] .. [[<C-r>0]] .. [[", ]] .. [[<C-r>0]] .. [[);<Esc>]]
    local keys = vim.api.nvim_replace_termcodes(macro, true, false, true)
    vim.fn.setreg("l", keys, "c")
  end,
})

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "css", "module.css" },
--   callback = function()
--     vim.cmd("vertical resize 40") -- set width to 80 columns
--   end,
-- })

-- Track last split type
local last_split_type = nil

vim.api.nvim_create_autocmd("WinNew", {
  callback = function()
    local layout = vim.fn.winlayout()
    local function get_last_split_direction(layout)
      if layout[1] == "row" then
        return "horizontal"
      end
      if layout[1] == "col" then
        return "vertical"
      end
      return nil
    end
    last_split_type = get_last_split_direction(layout)
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = { "*.css", "*.scss", "*.less" },
  callback = function(args)
    local fname = vim.fn.expand(args.file)
    local is_module = fname:match("module%.css$")

    if
      last_split_type == "vertical"
      and (fname:match("%.css$") or fname:match("%.scss$") or fname:match("%.less$") or is_module)
    then
      vim.cmd("vertical resize 10")
    end
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "YankyPut", { link = "IncSearch" })
    vim.api.nvim_set_hl(0, "YankyYanked", { link = "Search" })
  end,
})
