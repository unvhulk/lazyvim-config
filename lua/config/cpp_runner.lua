local M = {}

local term_bufnr = nil
local term_winid = nil
local term_chan_id = nil

function M.run_cpp()
  local file = vim.fn.expand("%:p")
  local filename = vim.fn.expand("%:t:r")
  local out = "/tmp/" .. filename
  local full_cmd = string.format("clear && g++ -std=c++17 %s -o %s && %s\n", file, out, out)

  -- Create terminal if not valid
  if not (term_bufnr and vim.api.nvim_buf_is_valid(term_bufnr)) then
    vim.cmd("botright split | resize 12 | terminal")
    term_bufnr = vim.api.nvim_get_current_buf()
    term_winid = vim.api.nvim_get_current_win()
    term_chan_id = vim.b.terminal_job_id
  else
    -- If terminal buffer exists, bring it to view
    if not (term_winid and vim.api.nvim_win_is_valid(term_winid)) then
      vim.cmd("botright split")
      vim.api.nvim_win_set_buf(0, term_bufnr)
      term_winid = vim.api.nvim_get_current_win()
    else
      vim.api.nvim_set_current_win(term_winid)
    end
  end

  -- Send command to terminal
  vim.fn.chansend(term_chan_id, full_cmd)
end

return M
