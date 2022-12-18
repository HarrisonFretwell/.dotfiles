vim.keymap.set("n", "d", '"_d')
vim.keymap.set("n", "D", '"_D')
vim.keymap.set("v", "d", '"_d')
vim.keymap.set("n", "<leader>d", '""d')
vim.keymap.set("n", "<leader>D", '""D')
vim.keymap.set("v", "<leader>d", '""d')

vim.keymap.set({ "n", "x", "o" }, "s", "<Cmd>Svart<CR>") -- begin exact search
vim.keymap.set({ "n", "x", "o" }, "S", "<Cmd>SvartRegex<CR>") -- begin regex search
vim.keymap.set({ "n", "x", "o" }, "gs", "<Cmd>SvartRepeat<CR>") -- repeat with last accepted query

vim.keymap.set("n", "<leader>u", "<Cmd>UndotreeToggle<CR>", { desc = "Toggle undotree" })
