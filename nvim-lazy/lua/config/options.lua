-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.re = 2

vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.cursorline = false
vim.opt.cursorcolumn = false
vim.opt.wrap = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.number = true
vim.opt.spell = true
vim.opt.spelllang = { "en_us" }

vim.opt.colorcolumn = ""
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.equalalways = false
vim.opt.updatetime = 100
vim.opt.modeline = false

vim.opt.tags = { vim.fn.expand("~/devel/tags") }

vim.g.lazyvim_picker = "fzf"
