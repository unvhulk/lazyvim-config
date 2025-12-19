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

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python" },
  callback = function()
    local macro = [[yiwoprint("]] .. [[<C-r>0]] .. [[", ]] .. [[<C-r>0]] .. [[)<Esc>]]
    local keys = vim.api.nvim_replace_termcodes(macro, true, false, true)
    vim.fn.setreg("l", keys, "c")
  end,
})

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

-- ============================================================================
-- Git Auto-Sync for Notes Repository
-- ============================================================================
-- Configuration
local git_auto_sync_config = {
  repo_path = vim.fn.expand("~/dev/notes"),
  commit_message_format = "Auto-sync: %s", -- %s = relative filename
  notify_on_success = true, -- Set to true to see success notifications
  notify_on_error = true, -- Show warnings when sync fails
}

-- Check if current file is in the notes repo
local function is_in_notes_repo()
  local current_file = vim.fn.expand("%:p")
  return vim.startswith(current_file, git_auto_sync_config.repo_path)
end

-- Get relative filename for commit message
local function get_relative_filename()
  local full_path = vim.fn.expand("%:p")
  local relative = full_path:gsub(git_auto_sync_config.repo_path .. "/", "")
  return relative
end

-- Async git sync operation
local function git_auto_sync()
  if not is_in_notes_repo() then
    return
  end

  local filename = get_relative_filename()
  local commit_msg = string.format(git_auto_sync_config.commit_message_format, filename)

  -- Git command chain:
  -- 1. Pull with rebase to get latest changes
  -- 2. Add all changes (including moves/deletes in subdirs)
  -- 3. Commit if there are staged changes
  -- 4. Push to remote
  local cmd = string.format(
    "cd '%s' && "
      .. "git pull --rebase --autostash 2>&1 && "
      .. "git add -A 2>&1 && "
      .. "(git diff --cached --quiet || git commit -m '%s' 2>&1) && "
      .. "git push 2>&1",
    git_auto_sync_config.repo_path,
    commit_msg:gsub("'", "'\\''") -- Escape single quotes
  )

  -- Run asynchronously
  vim.fn.jobstart({ "sh", "-c", cmd }, {
    on_exit = function(_, exit_code, _)
      if exit_code == 0 then
        if git_auto_sync_config.notify_on_success then
          vim.notify("✓ Synced: " .. filename, vim.log.levels.INFO)
        end
      else
        if git_auto_sync_config.notify_on_error then
          vim.notify("⚠ Git sync failed. Check :!git status in notes repo", vim.log.levels.WARN)
        end
      end
    end,
    on_stderr = function(_, data, _)
      if data and #data > 0 and data[1] ~= "" then
        local stderr_text = table.concat(data, "\n")
        -- Only notify on real errors
        if stderr_text:match("error") or stderr_text:match("fatal") then
          if git_auto_sync_config.notify_on_error then
            vim.notify("Git sync error: " .. stderr_text, vim.log.levels.ERROR)
          end
        end
      end
    end,
    stdout_buffered = true,
    stderr_buffered = true,
  })
end

-- Create augroup for git auto-sync
local git_sync_group = vim.api.nvim_create_augroup("GitAutoSync", { clear = true })

-- Auto-sync on save for markdown files in notes repo
vim.api.nvim_create_autocmd("BufWritePost", {
  group = git_sync_group,
  pattern = "*.md",
  callback = function()
    -- Small delay to ensure file is fully written
    vim.defer_fn(git_auto_sync, 100)
  end,
  desc = "Auto-sync notes repository to git",
})

-- Show notification when entering notes repo
vim.api.nvim_create_autocmd("VimEnter", {
  group = git_sync_group,
  callback = function()
    if is_in_notes_repo() then
      vim.notify("📝 Git auto-sync enabled for notes repo", vim.log.levels.INFO)
    end
  end,
  once = true,
})
