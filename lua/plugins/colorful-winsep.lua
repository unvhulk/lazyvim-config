return {
  "nvim-zh/colorful-winsep.nvim",
  event = "WinNew", -- more appropriate than just WinLeave for setup
  opts = {
    hi = {
      bg = "#1e1e2e", -- darker background
      fg = "#89b4fa", -- light bluish foreground, stands out
    },
    no_exec_files = { "packer", "TelescopePrompt", "mason", "CompetiTest", "NvimTree" },
    symbols = { "━", "┃", "┏", "┓", "┗", "┛" },
    only_line_seq = true,
    smooth = true,
    exponential_smoothing = true,
    anchor = {
      left = { height = 1, x = -1, y = -1 },
      right = { height = 1, x = -1, y = 0 },
      up = { width = 0, x = -1, y = 0 },
      bottom = { width = 0, x = 1, y = 0 },
    },
    light_pollution = function(lines) end,
  },
}
