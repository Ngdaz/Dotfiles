-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap.set
local Util = require("lazyvim.util")

local opts = { noremap = true, silent = true }
-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<leader>i", "<cmd>Lazy<cr>", { desc = "Lazy" })
keymap("n", "<leader>T", "<cmd> Telescope live_grep <cr>", { desc = "Find Text" })
keymap("n", "<leader>h", "<cmd>nohlsearch<CR><esc>", { silent = true, desc = "No Highlights" })

keymap({ "n", "v" }, "<leader>l", function()
  Util.format({ force = true })
end, { desc = "Format Code" })

keymap("n", "<C-S-j>", ":t.<CR>", opts)
-- Copy line down for Macos
