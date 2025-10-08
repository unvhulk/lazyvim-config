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

-- Adds console.log() for js using register l
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
  callback = function()
    local macro = [[yiwoconsole.log("]] .. [[<C-r>0]] .. [[", ]] .. [[<C-r>0]] .. [[);<Esc>]]
    local keys = vim.api.nvim_replace_termcodes(macro, true, false, true)
    vim.fn.setreg("l", keys, "c")
  end,
})

-- Listen for opencode events
vim.api.nvim_create_autocmd("User", {
  pattern = "OpencodeEvent",
  callback = function(args)
    -- See the available event types and their properties
    vim.notify(vim.inspect(args.data), vim.log.levels.DEBUG)
    -- Do something interesting, like show a notification when opencode finishes responding
    if args.data.type == "session.idle" then
      vim.notify("opencode finished responding", vim.log.levels.INFO)
    end
  end,
})
--
-- local function augroup(name)
--   return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
-- end
--
-- vim.api.nvim_create_autocmd("VimEnter", {
--   group = augroup("start_opencode"),
--   callback = function()
--     print("Attempting to start opencode server...")
--     vim.fn.system("opencode &")
--   end,
--   desc = "Start opencode server automatically on Vim enter",
-- })

-- Fixing width size
-- vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter", "VimEnter" }, {
--   callback = function()
--     vim.defer_fn(function()
--       local wins = vim.api.nvim_tabpage_list_wins(0)
--
--       local rightmost_win = nil
--       local max_col = -1
--
--       for _, win in ipairs(wins) do
--         if vim.api.nvim_win_is_valid(win) then
--           local pos = vim.api.nvim_win_get_position(win)
--           local col = pos[2] -- (row, col), col is x-axis
--           if col > max_col then
--             max_col = col
--             rightmost_win = win
--           end
--         end
--       end
--
--       if rightmost_win then
--         vim.wo[rightmost_win].winfixwidth = true
--         vim.api.nvim_win_set_width(rightmost_win, 60)
--       end
--     end, 50) -- slight delay for layout to settle
--   end,
-- })
--

vim.opt.equalalways = false

--  Adds highlighting for yanky on theme change
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "YankyPut", { link = "IncSearch" })
    vim.api.nvim_set_hl(0, "YankyYanked", { link = "Search" })
  end,
})

-- Prevent auto-insert mode in terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.cmd("stopinsert")
  end,
})
