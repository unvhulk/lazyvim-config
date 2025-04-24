local isTransparent = false

return {
  {
    "EdenEast/nightfox.nvim",
    lazy = true,
    name = "nightfox",
    config = function()
      require("nightfox").setup({
        options = {
          transparent = isTransparent,
        },
      })
    end,
  },

  {
    "olivercederborg/poimandres.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("poimandres").setup({
        -- leave this setup function empty for default config
        -- or refer to the configuration section
        -- for configuration options
        transparent = isTransparent,
      })
    end,
  },

  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      variant = "dark",
      transparent = isTransparent,
    },
  },
  {
    "rebelot/kanagawa.nvim",
    opts = {
      transparent = isTransparent,
    },
  },

  {
    "folke/tokyonight.nvim",
    opts = {
      -- transparent = true,
      -- transparent = false,
      transparent = isTransparent,
      style = "night",
      styles = { sidebars = "dark" },
      sidebars = { "qf", "help", "terminal" },
      dim_inactive = true,
      lualine_bold = true,
      on_highlights = function(hl, c)
        -- Brighten the relative line numbers
        hl.LineNrAbove = { fg = c.red }
        hl.CursorLineNr = { fg = c.white }
        hl.LineNrBelow = { fg = c.green }
        hl.FloatBorder = { fg = c.magenta, bg = c.none }
        hl.WinSeparator = { fg = c.white, bg = c.none }
      end,
    },
  },

  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        custom_highlights = function(colors)
          return {
            Comment = { fg = colors.flamingo },
            TabLineSel = { bg = colors.pink },
            CmpBorder = { fg = colors.surface2 },
            Pmenu = { bg = colors.none },
          }
        end,
        -- transparent_background = true,
        transparent_background = isTransparent,
        -- transparent_background = false,
        integrations = {
          ts_rainbow = true,
          telescope = {
            enabled = true,
            style = "nvchad",
          },
          dropbar = {
            enabled = true,
            color_mode = true,
          },
        },
        color_overrides = {
          mocha = {
            rosewater = "#F5B8AB",
            flamingo = "#F29D9D",
            pink = "#AD6FF7",
            mauve = "#FF8F40",
            red = "#E66767",
            maroon = "#EB788B",
            peach = "#FAB770",
            yellow = "#FACA64",
            green = "#70CF67",
            teal = "#4CD4BD",
            sky = "#61BDFF",
            sapphire = "#4BA8FA",
            blue = "#00BFFF",
            lavender = "#00BBCC",

            text = "#F4CDE9",
            subtext1 = "#DEBAD4",
            subtext0 = "#C8A6BE",
            overlay2 = "#B293A8",
            overlay1 = "#9C7F92",
            overlay0 = "#866C7D",
            surface2 = "#705867",
            surface1 = "#5A4551",
            surface0 = "#44313B",

            base = "#000000",
            mantle = "#000000",
            crust = "#000000",
          },
        },
      })
    end,
    -- or just use opts table
    opts = {
      -- configurations
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "tokyonight",
      colorscheme = "cyberdream",
    },
  },
}
