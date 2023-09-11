vim.o.foldlevelstart = 1
return {
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ni", "<cmd>Neorg index<cr>", desc = "Goto Index" },
      { "<leader>nr", "<cmd>Neorg return<cr>", desc = "Close all neorg files" },
      { "<leader>nmn", "<cmd>Neorg mode neorg<cr>", desc = "Neorg mode" },
      { "<leader>nmh", "<cmd>Neorg mode traverse-heading<cr>", desc = "Heading traverse mode" },
      { "<leader>nt", "<cmd>Neorg toc<cr>", desc = "Table of contents" },
    },
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                work = "~/notes/work",
              },
              default_workspace = "work",
            },
          },
        },
      })
    end,
  },
}
