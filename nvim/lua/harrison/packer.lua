-- Only required if you have packer configured as `opt`packer
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use("nvim-lualine/lualine.nvim")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	use({ "neovim/nvim-lspconfig" })
	use("jose-elias-alvarez/typescript.nvim")
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })

	use({ "onsails/lspkind.nvim" })
	use("mfussenegger/nvim-dap")
	-- Autocompletion
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "saadparwaiz1/cmp_luasnip" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })

	-- Snippets
	use({ "L3MON4D3/LuaSnip" })
	use({ "rafamadriz/friendly-snippets" })
	use({ "jose-elias-alvarez/null-ls.nvim" })

	use({ "glepnir/lspsaga.nvim" })
	use("kyazdani42/nvim-web-devicons")

	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	})

	use({
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
					filetypes = {
						javascript = true, -- allow specific filetype
						typescript = true, -- allow specific filetype
						["*"] = false, -- disable for all other filetypes and ignore default `filetypes`
					},
				})
			end, 100)
		end,
	})

	use({
		"folke/noice.nvim",
		config = function()
			require("noice").setup({
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = true, -- add a border to hover docs and signature help
				},
			})
		end,
		requires = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	})

	use({
		"goolord/alpha-nvim",
	})

	--Themes
	use("cocopon/iceberg.vim")
	use("arcticicestudio/nord-vim")
	use("rakr/vim-two-firewatch")

	use({
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- mocha, macchiato, frappe, latte
			})
			vim.api.nvim_command("colorscheme catppuccin")
		end,
	})

	use("tpope/vim-commentary")
	-- Navgiation
	use({
		"ThePrimeagen/harpoon",
		config = function()
			require("harpoon").setup()
		end,
	})
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = {
			{ "nvim-lua/plenary.nvim" },
		},
	})
	use({ "nvim-telescope/telescope-project.nvim" })
	use({ "nvim-telescope/telescope-file-browser.nvim" })

	use("windwp/nvim-ts-autotag")
	use("windwp/nvim-autopairs")

	use({
		"lukas-reineke/indent-blankline.nvim",
		event = "VimEnter",
		config = function()
			require("indent_blankline").setup({
				buftype_exclude = { "terminal" },
				show_current_context = true,
				show_current_context_start = true,
			})
		end,
	})
	use("tpope/vim-surround")
	-- use({
	-- 	"ggandor/leap.nvim",
	-- 	config = function()
	-- 		require("leap").add_default_mappings()
	-- 	end,
	-- })
	use({
		"https://gitlab.com/madyanov/svart.nvim",
		as = "svart.nvim",
	})

	-- Prettier
	use("MunifTanjim/prettier.nvim")

	-- Language Specific
	-- Rust
	use("simrat39/rust-tools.nvim")

	-- Git
	use("lewis6991/gitsigns.nvim")
	use("kdheepak/lazygit.nvim")

	use("folke/which-key.nvim")

	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup({
				open_mapping = [[<c-\>]],
			})
		end,
	})
end)
