vim.o.termguicolors = true

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", ",", "<Nop>", opts)
vim.g.maplocalleader = ","

require("harrison.init")

vim.cmd("colorscheme catppuccin")
require("after.which-key")
require("after.telescope")
require("after.tree-sitter")
require("after.prettier")
require("after.lsp")
require("after.alpha")
require("after.git")
require("after.harpoon")
require("after.lualine")
-- require("after.neorg")

require("gitsigns").setup({})
