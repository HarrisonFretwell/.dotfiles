return {
  "ThePrimeagen/harpoon",
  config = function()
    local harpoon = require("harpoon.ui")
    local harpoon_mark = require("harpoon.mark")
    require("telescope").load_extension("harpoon")

    vim.keymap.set("n", "<leader>hs", harpoon_mark.add_file, { desc = "Add file" })
    vim.keymap.set("n", "<leader>hh", harpoon.toggle_quick_menu, { desc = "Quick menu" })
    vim.keymap.set("n", "<leader>ht", "<Cmd>Telescope harpoon marks<CR>", { desc = " Telescope" })
    vim.keymap.set("n", "<leader>hc", harpoon_mark.clear_all, { desc = "Clear all marks" })
    vim.keymap.set("n", "<leader>1", function()
      harpoon.nav_file(1)
    end, { desc = "Harpoon File 1" })
    vim.keymap.set("n", "<leader>2", function()
      harpoon.nav_file(2)
    end, { desc = "Harpoon File 2" })
    vim.keymap.set("n", "<leader>3", function()
      harpoon.nav_file(3)
    end, { desc = "Harpoon File 3" })
    vim.keymap.set("n", "<leader>4", function()
      harpoon.nav_file(4)
    end, { desc = "Harpoon File 4" })
    vim.keymap.set("n", "<leader>5", function()
      harpoon.nav_file(5)
    end, { desc = "Harpoon File 5" })
  end,
}
