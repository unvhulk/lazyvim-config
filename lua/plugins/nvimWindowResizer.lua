return {
  "s1n7ax/nvim-window-picker",
  name = "window-picker",
  opts = {
    autoselect_one = true,
    include_current = false,
    filter_rules = {
      -- optionally exclude floating and terminal windows
      bo = {
        filetype = { "neo-tree", "notify", "quickfix" },
        buftype = { "terminal", "nofile" },
      },
    },
  },
}
