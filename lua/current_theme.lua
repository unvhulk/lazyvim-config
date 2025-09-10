-- Auto-generated theme configuration
-- Theme: catppuccin (dark)
vim.opt.background = "dark"

local function set_theme()
    local ok, _ = pcall(vim.cmd, "colorscheme catppuccin-mocha")
    if not ok then
        vim.notify("Theme 'catppuccin-mocha' not found, using default", vim.log.levels.WARN)
        pcall(vim.cmd, "colorscheme default")
    end
end

set_theme()

return {
    theme = "catppuccin-mocha",
    background = "dark"
}
