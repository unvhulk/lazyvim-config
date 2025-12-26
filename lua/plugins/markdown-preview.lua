-- Markdown preview in browser
return {
  "iamcco/markdown-preview.nvim",
  ft = { "markdown" },
  keys = {
    {
      "<leader>lp",
      "<cmd>MarkdownPreviewToggle<cr>",
      desc = "Toggle Markdown Preview",
      ft = "markdown",
    },
  },
}
