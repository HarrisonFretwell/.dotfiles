vim.g.maplocalleader = ";"
require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.norg.concealer"] = {},
		["core.norg.completion"] = {
			config = {
				engine = "nvim-cmp",
			},
		},
		["core.keybinds"] = {
			config = {
				default_keybinds = true,
				neorg_leader = "<Leader>n",
			},
		},
		["core.norg.dirman"] = {
			config = {
				workspaces = {
					work = "~/notes/work",
					home = "~/notes/home",
				},
			},
		},
		["core.presenter"] = {
			config = {
				zen_mode = "zen-mode",
			},
		},
		["core.integrations.telescope"] = {}, -- Enable the telescope module
	},
})

-- Keybinds
vim.api.nvim_set_keymap("n", "<Leader>nn", ":Neorg<CR>", { noremap = true, silent = true, desc = "Neorg" })
vim.api.nvim_set_keymap(
	"n",
	"<Leader>nj",
	":Neorg journal<CR>",
	{ noremap = true, silent = true, desc = "Neorg journal" }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>nww",
	":Neorg workspace work<CR>",
	{ noremap = true, silent = true, desc = "Neorg workspace work" }
)
vim.api.nvim_set_keymap(
	"n",
	"<Leader>nwh",
	":Neorg workspace home<CR>",
	{ noremap = true, silent = true, desc = "Neorg workspace home" }
)
-- vim.api.nvim_set_keymap(
-- 	"n",
-- 	"<Leader>nt",
-- 	":Telescope neorg<CR>",
-- 	{ noremap = true, silent = true, desc = "Telescope neorg" }
)
