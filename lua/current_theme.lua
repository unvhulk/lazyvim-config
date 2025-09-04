-- Auto-generated theme configuration
-- Theme: onedark (dark)
vim.opt.background = "dark"

local function set_theme()
    local ok, _ = pcall(vim.cmd, "colorscheme onedark")
    if not ok then
        vim.notify("Theme 'onedark' not found, using default", vim.log.levels.WARN)
        pcall(vim.cmd, "colorscheme default")
    end
end

set_theme()

return {
    theme = "onedark",
    background = "dark"
}
