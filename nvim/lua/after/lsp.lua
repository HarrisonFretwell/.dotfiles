local lspkind = require("lspkind")
-- local lsp = require('lsp-zero')
local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = false,
})

local function on_attach(_, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

-- Add extra ts niceties, like import all missin
require("typescript").setup({
	disable_commands = false, -- prevent the plugin from creating Vim commands
	debug = false, -- enable debug logging for commands
	go_to_source_definition = {
		fallback = true, -- fall back to standard LSP definition on failure
	},
	server = { -- pass options to lspconfig's setup method
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
		on_attach = function(client)
			-- Diable formatter
			client.server_capabilities.documentFormattingProvider = false
		end,
		filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
		cmd = { "typescript-language-server", "--stdio" },
	},
})

nvim_lsp.sumneko_lua.setup({
	on_attach = on_attach,
})

-- Rust
-- nvim_lsp.rust_analyzer.setup{}
local rt = require("rust-tools")

-- Can get list of rust specific actions with prefix `:Rust`
rt.setup({
	server = {
		on_attach = function(_, bufnr)
			-- Hover actions
			vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
			-- Code action groups
			vim.keymap.set("n", "<Leader>co", "<Cmd>RustRunnables<CR>", { buffer = bufnr, desc = "Runnables" })
		end,
	},
})

local status, cmp = pcall(require, "cmp")
if not status then
	return
end

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-e>"] = cmp.mapping.close(),
		["<Tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "buffer" },
	}),
	formatting = {
		format = lspkind.cmp_format({ with_text = false, maxwidth = 50 }),
	},
	window = {},
})

vim.cmd([[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]])

local opts = { noremap = true, silent = true }
-- vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
-- vim.keymap.set("n", "gd", "<Cmd>Lspsaga lsp_finder<CR>", opts)
-- vim.keymap.set("n", "gp", "<Cmd>Lspsaga preview_definition<CR>", opts)
-- vim.keymap.set("i", "<C-Space>", "<Cmd>Lspsaga signature<CR>", opts)
-- vim.keymap.set("n", "<leader>cr", "<Cmd>Lspsaga rename<CR>", { desc = "Rename" })
-- vim.keymap.set("n", "<leader>ca", "<Cmd>Lspsaga code_action<CR>", { desc = "Code action" })
-- vim.keymap.set("n", "<leader>cd", "<Cmd>Lspsaga show_line_diagnostics<CR>", { desc = "Show line diagnostics" })
-- vim.keymap.set("n", "<leader>cd", "<Cmd>Lspsaga show_cursor_diagnostics<CR>", { desc = "Show diagnostics at cursor" })
-- vim.keymap.set("n", "<leader>cj", "<Cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Next diagnostic" })
-- vim.keymap.set("n", "<leader>ck", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Prev diagnostic" })
--
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<leader>ck", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "<leader>cj", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>cq", vim.diagnostic.setloclist, opts)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)

-- Trouble
vim.keymap.set("n", "<leader>xx", "<Cmd>TroubleToggle<CR>", { desc = "Trouble Toggle" })
vim.keymap.set("n", "<leader>xt", "<Cmd>TodoTrouble<CR>", { desc = "See project todos" })
vim.keymap.set(
	"n",
	"<leader>xw",
	"<cmd>TroubleToggle workspace_diagnostics<cr>",
	{ silent = true, noremap = true, desc = "Workspace Diagnostics" }
)
vim.keymap.set(
	"n",
	"<leader>xd",
	"<cmd>TroubleToggle document_diagnostics<cr>",
	{ silent = true, noremap = true, desc = "document_diagnostics" }
)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true, desc = "Loclist" })
vim.keymap.set(
	"n",
	"<leader>xq",
	"<cmd>TroubleToggle quickfix<cr>",
	{ silent = true, noremap = true, desc = "Quickfix" }
)
