return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    -- refer to `:h file-pattern` for more examples
    -- "BufReadPre ~/Documents/Obsidian Vault/*.md",
    -- "BufNewFile ~/Documents/Obsidian Vault/*.md",
  },

  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Documents/Obsidian Vault/",
      },
      {
        name = "work",
        path = "~/Documents/Obsidian Vault/",
      },
    },
  },

  -- Finally, this plugin also provides the following motions/mappings by default:
  --
  -- [[ and ]] to jump to the previous and next Markdown heading.
  -- zk and zj to move up and down while skipping folds.
  -- gl and gL to jump to the next and previous link.
  -- gf to open the link or file under the cursor (temporarily moving the cursor if necessary—e.g. if it's on the first square bracket of a [[Wikilink]]).
}
