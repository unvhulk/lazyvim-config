-- Enhanced Neovim theme integration
-- Add this to your ~/.config/nvim/lua/config/theme-manager.lua

local M = {}

-- File to watch for theme changes
local theme_file = vim.fn.expand("~/.config/nvim/lua/current_theme.lua")
local theme_watch_file = vim.fn.expand("~/.config/themes/current_theme")

-- Function to apply theme from file
function M.apply_theme()
  if vim.fn.filereadable(theme_file) == 1 then
    -- Clear the module cache to force reload
    package.loaded["current_theme"] = nil
    local ok, theme_config = pcall(require, "current_theme")
    if ok then
      vim.notify("Theme switched to: " .. (theme_config.theme or "unknown"), vim.log.levels.INFO)
    else
      vim.notify("Error loading theme configuration", vim.log.levels.ERROR)
    end
  end
end

-- Watch for theme file changes and auto-reload
function M.setup_file_watcher()
  -- Create autocmd to watch for file changes
  vim.api.nvim_create_autocmd({ "BufWritePost", "FileChangedShellPost" }, {
    pattern = { theme_file, theme_watch_file },
    callback = function()
      vim.defer_fn(function()
        M.apply_theme()
      end, 100) -- Small delay to ensure file is written
    end,
    desc = "Auto-reload theme when theme files change",
  })

  -- Also create a timer-based check (fallback)
  local timer = vim.loop.new_timer()
  if timer then
    local last_mtime = 0
    timer:start(
      1000,
      1000,
      vim.schedule_wrap(function() -- Check every second
        if vim.fn.filereadable(theme_watch_file) == 1 then
          local stat = vim.loop.fs_stat(theme_watch_file)
          if stat and stat.mtime.sec > last_mtime then
            last_mtime = stat.mtime.sec
            M.apply_theme()
          end
        end
      end)
    )
  end
end

-- Create user commands for manual control
function M.setup_commands()
  -- Command to reload theme
  vim.api.nvim_create_user_command("ThemeReload", function()
    M.apply_theme()
  end, { desc = "Reload current theme" })

  -- Command to switch theme directly from nvim
  vim.api.nvim_create_user_command("ThemeSet", function(opts)
    local args = vim.split(opts.args, "%s+")
    if #args < 2 then
      vim.notify("Usage: ThemeSet <theme> <variant>", vim.log.levels.ERROR)
      return
    end

    local theme, variant = args[1], args[2]
    local cmd = string.format("!~/bin/theme-manager.sh %s %s", theme, variant)
    vim.cmd(cmd)
  end, {
    nargs = "*",
    desc = "Set theme and variant",
    complete = function(ArgLead, CmdLine, CursorPos)
      -- Simple completion for common themes
      local themes = { "gruvbox", "catppuccin", "tokyo-night", "nord", "dracula", "kanagawa", "rose-pine" }
      local variants = { "dark", "light" }

      local args = vim.split(CmdLine, "%s+")
      if #args <= 2 then
        return vim.tbl_filter(function(theme)
          return theme:find("^" .. ArgLead)
        end, themes)
      elseif #args == 3 then
        return vim.tbl_filter(function(variant)
          return variant:find("^" .. ArgLead)
        end, variants)
      end
      return {}
    end,
  })
end

-- Initialize the theme manager
function M.setup()
  -- Apply current theme on startup
  M.apply_theme()

  -- Setup file watcher
  M.setup_file_watcher()

  -- Setup commands
  M.setup_commands()

  -- Create keymaps for quick theme switching (optional)
  vim.keymap.set("n", "<leader>tr", M.apply_theme, { desc = "Reload theme" })
  vim.keymap.set("n", "<leader>td", function()
    vim.cmd("ThemeSet gruvbox dark")
  end, { desc = "Switch to Gruvbox Dark" })
  vim.keymap.set("n", "<leader>tl", function()
    vim.cmd("ThemeSet gruvbox light")
  end, { desc = "Switch to Gruvbox Light" })
end

-- return M
