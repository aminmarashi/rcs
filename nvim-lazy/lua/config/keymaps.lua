-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("n", "<leader>w", "<cmd>w<cr>", { silent = true, desc = "Save file" })

-- Your old window-management style.
-- Note: this preserves your current tradeoff: normal Vim `w` word motion is replaced.
map("n", "w", "<C-w>", { silent = true, remap = true, desc = "Window prefix" })

-- FZF-like aliases, close to your existing mappings.
map("n", "<leader>f", function()
  require("fzf-lua").files({ cwd = vim.fn.expand("~/devel") })
end, { silent = true, desc = "Find files in ~/devel" })

map("n", "<leader>F", function()
  require("fzf-lua").files()
end, { silent = true, desc = "Find files in cwd" })

map("n", "<leader>a", function()
  require("fzf-lua").live_grep()
end, { silent = true, desc = "Ripgrep project" })

map("n", "<leader><leader>", function()
  require("fzf-lua").files({ cwd = vim.fn.expand("%:p:h") })
end, { silent = true, desc = "Find files near current file" })

map("n", "<leader>c", "<cmd>cd %:p:h<cr>", { silent = true, desc = "cd to current file dir" })
