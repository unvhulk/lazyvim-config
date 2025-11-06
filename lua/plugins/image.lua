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
        if
          term:match("kitty")
          or vim.env.KITTY_WINDOW_ID
          or vim.env.TERM_PROGRAM == "WezTerm"
          or vim.env.GHOSTTY_RESOURCES_DIR
        then
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
            only_render_image_at_cursor = true, -- Show image only at cursor position
            filetypes = { "markdown", "vimwiki", "md" },
          },
          neorg = {
            enabled = false,
          },
        },
        max_width = 1920, -- Large absolute width
        max_height = 1080, -- Large absolute height
        max_width_window_percentage = nil,
        max_height_window_percentage = nil,
        window_overlap_clear_enabled = true,
        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "", "neo-tree" },
        editor_only_render_when_focused = true, -- Only render when Neovim has focus
        tmux_show_only_in_active_window = true,
        hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" },
      })

      -- Clear images when leaving Neovim, losing focus, or switching buffers
      vim.api.nvim_create_autocmd({ "VimLeave", "VimSuspend", "FocusLost", "BufLeave" }, {
        pattern = "*.md,*.markdown",
        callback = function()
          local img = require("image")
          if img then
            img.clear()
          end
        end,
      })

      -- Add keybinding to manually clear images
      vim.keymap.set("n", "<leader>ic", function()
        require("image").clear()
        vim.notify("Cleared all images", vim.log.levels.INFO)
      end, { desc = "Clear all images" })

      -- Add keybinding to re-render images
      vim.keymap.set("n", "<leader>ir", function()
        local img = require("image")
        img.clear()
        vim.defer_fn(function()
          local api = require("image")
          for _, image in ipairs(api.get_images()) do
            image:render()
          end
        end, 100)
        vim.notify("Re-rendering images", vim.log.levels.INFO)
      end, { desc = "Re-render images" })

      -- Add keybinding to open image in external viewer for full size
      vim.keymap.set("n", "<leader>io", function()
        local line = vim.api.nvim_get_current_line()
        local image_path = line:match("!%[.-%]%((.-)%)")
        if image_path then
          -- Expand ~ and relative paths
          if image_path:match("^~") then
            image_path = vim.fn.expand(image_path)
          elseif not image_path:match("^/") then
            local current_file = vim.fn.expand("%:p:h")
            image_path = current_file .. "/" .. image_path
          end
          vim.fn.jobstart({ "xdg-open", image_path }, { detach = true })
          vim.notify("Opening image: " .. image_path, vim.log.levels.INFO)
        else
          vim.notify("No image found on this line", vim.log.levels.WARN)
        end
      end, { desc = "Open image in external viewer" })
    end,
  },
}
