local status, telescope = pcall(require, "telescope")
if not status then
	return
end

telescope.load_extension("project")
telescope.load_extension("file_browser")
telescope.load_extension("ui-select")
local telescope_builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

local function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

local fb_actions = require("telescope").extensions.file_browser.actions

vim.keymap.set("n", "<leader><leader>", telescope_builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fs", telescope_builtin.live_grep, { desc = "Search files" })
vim.keymap.set("n", "<leader><", telescope_builtin.buffers, { desc = "Open buffers" })
vim.keymap.set("n", "<leader>fl", function()
	telescope.extensions.file_browser.file_browser({
		path = "%:p:h",
		cwd = telescope_buffer_dir(),
		respect_gitignore = false,
		-- grouped = true,
		-- previewer = true,
		initial_mode = "normal",
		layout_config = { height = 40 },
	})
end, { desc = "Open file browser" })
vim.keymap.set("n", "<leader>k", telescope_builtin.help_tags, { desc = "Command list" })
vim.keymap.set("n", "<leader>pp", "<cmd>Telescope project<CR>", { desc = "Projects" })
vim.keymap.set("n", "<leader>pw", "<cmd>Telescope change_working_directory<CR>", { desc = "Change working directory" })

telescope.setup({
	defaults = {
		mappings = {
			n = {
				["q"] = actions.close,
				["<c-t>"] = trouble.open_with_trouble,
			},
			i = { ["<c-t>"] = trouble.open_with_trouble },
		},
		file_ignore_patterns = {
			"node_modules",
			"storybook-static",
		},
	},
	extensions = {
		file_browser = {
			theme = "dropdown",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				-- your custom insert mode mappings
				["i"] = {
					["<C-w>"] = function()
						vim.cmd("normal vbd")
					end,
				},
				["n"] = {
					-- your custom normal mode mappings
					["N"] = fb_actions.create,
					["h"] = fb_actions.goto_parent_dir,
					["/"] = function()
						vim.cmd("startinsert")
					end,
				},
			},
		},
		project = {
			order_by = "recent",
		},
		frecency = {
			show_unindexed = false,
			default_workspace = "CWD",
		},
		["ui-select"] = {
			require("telescope.themes").get_dropdown({
				-- even more opts
			}),
		},
	},
})
