local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.setup({
	server = {
		capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
	},
})

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = false,
})

-- Add extra ts niceties, like import all missin
require("typescript").setup({
	disable_commands = false, -- prevent the plugin from creating Vim commands
	debug = false, -- enable debug logging for commands
	go_to_source_definition = {
		fallback = true, -- fall back to standard LSP definition on failure
	},
	server = { -- pass options to lspconfig's setup method
		capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
		on_attach = function(client)
			-- Diable formatter
			client.server_capabilities.documentFormattingProvider = false
		end,
		filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
		cmd = { "typescript-language-server", "--stdio" },
	},
})

-- Rust
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

vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
vim.keymap.set("n", "<leader>ck", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
vim.keymap.set("n", "<leader>cj", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Goto declaration" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto definition" })
vim.keymap.set("n", "gr", function() vim.lsp.buf.references({includeDeclaration= false}) end, { desc = "Goto definition" })
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Goto implementation" })
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help)
vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, { desc = "Code action" })

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
