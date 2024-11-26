-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.clipboard = "unnamedplus"
-- Enable word wrap by default
vim.o.wrap = true

-- Neovide settings
if vim.g.neovide then
  vim.opt.clipboard = "unnamedplus"
  vim.o.guifont = "JetBrainsMono Nerd Font:h14"
  vim.g.neovide_transparency = 0.5
  vim.g.neovide_fullscreen = true
end

-- local wk = require("which-key")
--
-- wk.add({
--   -- Define the AI group
--   { "<leader>a", group = "AI" }, -- group
--
--   -- Individual keybindings within the AI group
--   { "<leader>aa", "<cmd>ChatGPTRun add_tests<CR>", desc = "Add Tests", mode = { "n", "v" } },
--   { "<leader>ac", "<cmd>ChatGPT<CR>", desc = "ChatGPT", mode = { "n", "v" } },
--   { "<leader>ad", "<cmd>ChatGPTRun docstring<CR>", desc = "Docstring", mode = { "n", "v" } },
--   { "<leader>ae", "<cmd>ChatGPTEditWithInstruction<CR>", desc = "Edit with instruction", mode = { "n", "v" } },
--   { "<leader>af", "<cmd>ChatGPTRun fix_bugs<CR>", desc = "Fix Bugs", mode = { "n", "v" } },
--   { "<leader>ag", "<cmd>ChatGPTRun grammar_correction<CR>", desc = "Grammar Correction", mode = { "n", "v" } },
--   { "<leader>ak", "<cmd>ChatGPTRun keywords<CR>", desc = "Keywords", mode = { "n", "v" } },
--   {
--     "<leader>al",
--     "<cmd>ChatGPTRun code_readability_analysis<CR>",
--     desc = "Code Readability Analysis",
--     mode = { "n", "v" },
--   },
--   { "<leader>ao", "<cmd>ChatGPTRun optimize_code<CR>", desc = "Optimize Code", mode = { "n", "v" } },
--   { "<leader>ar", "<cmd>ChatGPTRun roxygen_edit<CR>", desc = "Roxygen Edit", mode = { "n", "v" } },
--   { "<leader>as", "<cmd>ChatGPTRun summarize<CR>", desc = "Summarize", mode = { "n", "v" } },
--   { "<leader>at", "<cmd>ChatGPTRun translate<CR>", desc = "Translate", mode = { "n", "v" } },
--   { "<leader>ax", "<cmd>ChatGPTRun explain_code<CR>", desc = "Explain Code", mode = { "n", "v" } },
--
--   -- Additional general mappings can go here
-- }, { prefix = "" }) -- No additional prefix for this setup
