return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      ---@type lspconfig.options
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
            },
          },
        },
        -- Add more servers here if needed
      },
      setup = {
        -- Disable LazyVim's default mason-lspconfig mappings if they fail
        ["*"] = function(server, opts)
          local ok, lspconfig = pcall(require, "lspconfig")
          if not ok then
            return false
          end
          lspconfig[server].setup(opts)
          return true
        end,
      },
    },
  },

  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },

  { import = "lazyvim.plugins.extras.lang.typescript" },
}
