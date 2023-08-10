local M = {}
local override = require "custom.override"

M.plugins = {

  override = {
    ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
    ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
    ["lukas-reineke/indent-blankline.nvim"] = override.blankline,
    -- ["goolord/alpha-nvim"] = override.alpha,
    ["williamboman/mason.nvim"] = override.mason,
  },

  user = require "custom.plugins",

  remove = {
    "folke/which-key.nvim",
    "goolord/alpha-nvim",
  },
}

M.ui = {
  theme = "catppuccin",
  hl_add = require("custom.highlights").new_hlgroups,
  theme_toggle = { "nightowl", "gruvchad" },
  hl_override = require("custom.highlights").overriden_hlgroups,
  transparency = false,
}

M.mappings = require "custom.mappings"

return M
