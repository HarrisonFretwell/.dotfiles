local wk = require("which-key")

wk.register({
	f = {
		name = "Files",
	},
	p = {
		name = "Projects",
	},
	x = {
		name = "Trouble",
	},
	g = {
		name = "Git",
	},
	c = {
		name = "LSP",
	},
	h = {
		name = "Harpoon",
	},
	d = { "d", "Delete" },
	w = { "<C-w>", "Window" },
	s = { "<Cmd>w<CR>", "Save" },
	i = { "<Cmd>MarkdownPreview<CR>", "Markdown Preview" },
	n = {
		name = "Neorg",
	},
}, { prefix = "<leader>" })

vim.keymap.set("n", "d", '"_d', { desc = "Delete" })
vim.keymap.set("n", "D", '"_D', { desc = "Delete" })
vim.keymap.set("v", "d", '"_d')
vim.keymap.set("n", "<leader>D", '""D', { desc = "Cut line" })
vim.keymap.set("n", "<leader>d", '""d', { desc = "Cut" })
