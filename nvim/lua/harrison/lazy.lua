require("lazy").setup({
	"folke/which-key.nvim",
	{ "nvim-telescope/telescope.nvim", dependencies = {
		"nvim-lua/plenary.nvim",
	} },
	{ "nvim-telescope/telescope-project.nvim" },
	"nvim-telescope/telescope-file-browser.nvim",
	"nvim-telescope/telescope-ui-select.nvim",
	{
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
	},
	{
		"folke/trouble.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- mocha, macchiato, frappe, latte
			})
			vim.api.nvim_command("colorscheme catppuccin")
		end,
	},
	"nvim-lualine/lualine.nvim",
	{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
	{ "neovim/nvim-lspconfig" },
	"jose-elias-alvarez/typescript.nvim",
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "onsails/lspkind.nvim" },
	"mfussenegger/nvim-dap",
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-nvim-lua" },
	{ "L3MON4D3/LuaSnip" },
	{ "rafamadriz/friendly-snippets" },
	{ "jose-elias-alvarez/null-ls.nvim" },
	"mbbill/undotree",
	"kyazdani42/nvim-web-devicons",
	{
		"zbirenbaum/copilot.lua",
		event = "VimEnter",
		config = function()
			vim.defer_fn(function()
				require("copilot").setup({
					suggestion = {
						enabled = true,
						auto_trigger = true,
						debounce = 75,
						keymap = {
							accept = "<C-F>",
							next = "<M-]>",
							prev = "<M-[>",
							dismiss = "<C-]>",
						},
					},
					-- filetypes = {
					-- 	javascript = true,
					-- 	typescript = true,
					-- 	typescriptreact = true,
					-- 	-- ["*"] = false, -- disable for all other filetypes and ignore default `filetypes`
					-- },
				})
			end, 100)
		end,
	},
	{
		"folke/twilight.nvim",
		config = function()
			require("twilight").setup({})
		end,
	},
	{
		"folke/noice.nvim",
		config = function()
			require("noice").setup({
				lsp = {
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				presets = {
					bottom_search = true, --  a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = true, -- add a border to hover docs and signature help
				},
			})
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	{ "goolord/alpha-nvim" },
	{
		"folke/drop.nvim",
		event = "VimEnter",
		config = function()
			math.randomseed(os.time())
			local theme = ({ "stars", "snow", "xmas" })[math.random(1, 3)]
			require("drop").setup({ theme = theme })
		end,
	},
	"tpope/vim-commentary",
	{
		"ThePrimeagen/harpoon",
		config = function()
			require("harpoon").setup()
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
		},
	},
	{ "nvim-telescope/telescope-project.nvim" },
	{ "nvim-telescope/telescope-file-browser.nvim" },
	{ "nvim-telescope/telescope-ui-select.nvim" },
	"windwp/nvim-ts-autotag",
	"windwp/nvim-autopairs",
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup()
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VimEnter",
		config = function()
			require("indent_blankline").setup({
				buftype_exclude = { "terminal" },
				show_current_context = true,
				show_current_context_start = true,
			})
		end,
	},
	"tpope/vim-surround",
	{
		url = "https://gitlab.com/madyanov/svart.nvim",
		as = "svart.nvim",
	},
	"MunifTanjim/prettier.nvim",
	"simrat39/rust-tools.nvim",
	{
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	"lewis6991/gitsigns.nvim",
	"kdheepak/lazygit.nvim",
	{
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup({
				open_mapping = [[<c-\>]],
			})
		end,
	},
})
