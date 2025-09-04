local isTransparent = false

local function toggle_transparency()
  isTransparent = not isTransparent
  vim.cmd("colorscheme") -- Reload the current colorscheme
  print("Transparency toggled: " .. tostring(isTransparent))
end

return {
  toggle_transparency = toggle_transparency,
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true,
    opts = {
      transparent_mode = isTransparent,
    },
  },

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
    opts = function(_, opts)
      opts.transparent = true
      opts.italic_comments = true
    end,
  },

  -- modicator (auto color line number based on vim mode)
  {
    "mawkler/modicator.nvim",
    dependencies = "scottmckendry/cyberdream.nvim",
    init = function()
      -- These are required for Modicator to work
      vim.o.cursorline = false
      vim.o.number = true
      vim.o.termguicolors = true
    end,
    opts = {},
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
        -- hl.Folded = { fg = c.white, bg = "#44313B" }
        hl.Folded = { fg = c.white, bg = "#333333" }
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
          macchiato = {
            base = "#000000",
            mantle = "#000000",
            crust = "#000000",
          },
          frappe = {
            base = "#000000",
            mantle = "#000000",
            crust = "#000000",
          },
          latte = {
            base = "#0b001c", -- main background
            mantle = "#1c1c1c", -- side panels
            crust = "#262626", -- outermost UI

            surface0 = "#262626", -- popups
            surface1 = "#393939",
            surface2 = "#525252",

            overlay0 = "#6f6f6f",
            overlay1 = "#8d8d8d",
            overlay2 = "#a8a8a8",

            text = "#ffffff", -- main text
            subtext1 = "#f2f4f8",
            subtext0 = "#dde1e6",

            red = "#ee5396", -- errors
            maroon = "#ff7eb6", -- hint
            peach = "#ff6f00", -- diagnostic orange
            yellow = "#f1c21b", -- warning
            green = "#42be65", -- success
            teal = "#3ddbd9", -- constants
            blue = "#78a9ff", -- functions
            sapphire = "#4589ff", -- types
            lavender = "#be95ff", -- keywords
            mauve = "#d4bbff", -- regex/operator
            pink = "#ff7eb6", -- builtins

            rosewater = "#fa4d56", -- git added
            flamingo = "#ff6f00", -- deletions
          },

          -- latte = {
          --   base = "#0b001c", -- main background: pure dark gray
          --   -- base = "#000000", -- main background: pure dark gray
          --   mantle = "#1c1c1c", -- side panels: softened but not black
          --   crust = "#262626", -- outermost UI: moderate gray
          --
          --   surface0 = "#333333", -- popups/telescope
          --   surface1 = "#3c3c3c",
          --   surface2 = "#4d4d4d",
          --
          --   overlay0 = "#666666", -- borders/dividers
          --   overlay1 = "#777777",
          --   overlay2 = "#888888",
          --
          --   text = "#f0f0f0", -- main font: crisp light gray
          --   subtext1 = "#dddddd", -- secondary text
          --   subtext0 = "#bbbbbb", -- faint hints
          --
          --   -- Regal + vibrant hues
          --   red = "#d74747", -- errors (deep pop red)
          --   maroon = "#a83249", -- LSP hint
          --   peach = "#ff884d", -- diagnostics (bright orange)
          --   yellow = "#ffc857", -- warnings
          --   green = "#48b685", -- success
          --   teal = "#00bfa6", -- constants
          --   blue = "#539afc", -- functions / normal identifiers
          --   sapphire = "#307ec7", -- types / classes
          --   lavender = "#9cffff", -- keywords / flow control
          --   mauve = "#c678dd", -- regex / operator
          --   pink = "#f07cc2", -- builtin
          --
          --   -- Optional: UI accents
          --   rosewater = "#f58ca3", -- git add or inline hints
          --   flamingo = "#e45664", -- deletions
          -- },
        },
      })
    end,
    -- or just use opts table
    opts = {
      -- configurations
    },
  },

  { "rose-pine/neovim", name = "rose-pine" },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "carbonfox",
      -- colorscheme = "catppuccin-latte",
    },
  },
}
