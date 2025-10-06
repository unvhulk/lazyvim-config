return {
  "claude-code-terminal",
  name = "claude-code-terminal",
  dir = vim.fn.stdpath("config"),
  config = function()
    -- Store terminal buffer number for toggling
    local claude_terminal_buf = nil
    local claude_terminal_win = nil

    -- Function to toggle Claude Code terminal
    local function claude_code_toggle()
      -- Check if terminal window is open and valid
      if claude_terminal_win and vim.api.nvim_win_is_valid(claude_terminal_win) then
        -- Close the window
        vim.api.nvim_win_close(claude_terminal_win, false)
        claude_terminal_win = nil
        return
      end

      -- Check if we have a valid terminal buffer
      if claude_terminal_buf and vim.api.nvim_buf_is_valid(claude_terminal_buf) then
        -- Open existing terminal in vertical split with reduced size
        vim.cmd("60vsplit")
        claude_terminal_win = vim.api.nvim_get_current_win()
        vim.api.nvim_win_set_buf(claude_terminal_win, claude_terminal_buf)
        vim.cmd("startinsert")
      else
        -- Create new terminal with reduced size
        vim.cmd("60vsplit")
        claude_terminal_win = vim.api.nvim_get_current_win()
        vim.cmd("terminal")
        claude_terminal_buf = vim.api.nvim_get_current_buf()

        -- Send claude code init command to terminal
        local job_id = vim.b.terminal_job_id
        if job_id then
          vim.fn.chansend(job_id, "claude \n")
        end

        vim.cmd("startinsert")
      end
    end

    -- Create user command
    vim.api.nvim_create_user_command("ClaudeCode", claude_code_toggle, {
      desc = "Toggle Claude Code terminal",
    })

    -- Add keymap for Claude Code toggle
    vim.keymap.set("n", "<leader>ac", claude_code_toggle, { desc = "Toggle Claude Code Terminal" })
  end,
}
