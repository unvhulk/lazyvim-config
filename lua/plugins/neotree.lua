return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "adelarsq/image_preview.nvim",
    },
    opts = {
      filesystem = {
        follow_current_file = true, -- Automatically follow the current file
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          window = {
            mappings = {
              ["I"] = "image_wezterm", -- " or another map
            },
          },
          commands = {
            image_wezterm = function(state)
              local node = state.tree:get_node()
              if node.type == "file" then
                require("image_preview").PreviewImage(node.path)
              end
            end,
          },
        },
      },
      -- buffers = {
      --   follow_current_file = true, -- Automatically follow the current buffer
      -- },
      git_status = {
        follow_current_file = true, -- Automatically follow the current file in git status
      },
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function()
            vim.cmd("set relativenumber")
          end,
        },
        {
          event = "neo_tree_window_open",
          handler = function()
            vim.cmd("set relativenumber")
          end,
        },
      },
    },
  },
}
