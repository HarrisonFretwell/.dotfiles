-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end
-- Fix issue  with esc+j moving lines around
map("n", "<A-k>", "<esc>k", { desc = "Move up" })
map("n", "<A-j>", "<esc>j", { desc = "Move down" })
map("i", "<A-k>", "<esc>gk", { desc = "Move up" })
map("i", "<A-j>", "<esc>gj", { desc = "Move down" })
map("v", "<A-k>", "<esc>gk", { desc = "Move up" })
map("v", "<A-j>", "<esc>gj", { desc = "Move down" })
