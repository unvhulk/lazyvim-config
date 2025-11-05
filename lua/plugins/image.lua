return {
  -- Image preview plugin for viewing images in external viewer
  {
    "adelarsq/image_preview.nvim",
    event = "VeryLazy",
    config = function()
      require("image_preview").setup()
    end,
  },

  -- img-clip.nvim for pasting images from clipboard
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {
      default = {
        -- Default directory to save images (relative to current file)
        dir_path = function()
          return vim.fn.expand("%:p:h") .. "/images"
        end,
        -- File name format (timestamp-based)
        file_name = "%Y-%m-%d-%H-%M-%S",
        -- Use relative paths in markdown links
        relative_to_current_file = true,
        -- Prompt for confirmation before saving
        prompt_for_file_name = false,
        -- Show notification after saving
        show_dir_path_in_prompt = true,
        -- Use absolute path if file not in a git repo
        use_absolute_path = false,
        -- Template for markdown insertion
        template = "![$FILE_NAME]($FILE_PATH)",
      },
      -- Filetype specific settings
      filetypes = {
        markdown = {
          url_encode_path = false,
          template = "![$CURSOR]($FILE_PATH)",
          download_images = true,
        },
      },
    },
    keys = {
      -- Paste image from clipboard with <leader>p
      { "<leader>pi", "<cmd>PasteImage<cr>", desc = "Paste image from clipboard" },
    },
  },

  -- image.nvim for inline image rendering (DISABLED - requires ueberzug installation)
  -- To enable: Install dependencies first:
  --   sudo apt-get install libxres-dev libx11-dev libxext-dev
  --   pip3 install ueberzug
  -- Then uncomment this block:
  {
    "3rd/image.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      -- Detect terminal and use appropriate backend
      local function get_backend()
        local term = vim.env.TERM or ""
        -- Ghostty, Kitty, and WezTerm all support kitty graphics protocol
        if term:match("kitty") or vim.env.KITTY_WINDOW_ID or vim.env.TERM_PROGRAM == "WezTerm" or vim.env.GHOSTTY_RESOURCES_DIR then
          return "kitty"
        else
          return "ueberzug"
        end
      end

      require("image").setup({
        backend = get_backend(),
        integrations = {
          markdown = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            filetypes = { "markdown", "vimwiki", "md" },
          },
          neorg = {
            enabled = false,
          },
        },
        max_width = nil,
        max_height = nil,
        max_width_window_percentage = nil,
        max_height_window_percentage = 50,
        window_overlap_clear_enabled = false,
        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "", "neo-tree" },
        editor_only_render_when_focused = false,
        tmux_show_only_in_active_window = false,
        hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" },
      })
    end,
  },
}
