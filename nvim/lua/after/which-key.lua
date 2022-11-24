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
	w = { "<C-w>", "Window" },
	s = { "<Cmd>w<CR>", "Save" },
}, { prefix = "<leader>" })
