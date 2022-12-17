vim.smartindent = true

vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
-- No line wraps
vim.opt.wrap = false

vim.opt.background = dark
vim.opt.termguicolors = true

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
-- Don't keep terms highlighted after search
vim.opt.hlsearch = false
-- Lets you do searches like '/vim .* ='
vim.opt.incsearch = true
-- 50ms before activating plugins
vim.opt.updatetime = 50
--Always have at least 12 lines towards the bottom
vim.opt.scrolloff = 12

vim.g.mapleader = " "
