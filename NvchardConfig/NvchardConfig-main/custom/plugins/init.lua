return {
  -- autoclose tags in html, jsx etc
  ["windwp/nvim-ts-autotag"] = {
    ft = { "html", "javascriptreact" },
    after = "nvim-treesitter",
    config = function()
      require("custom.plugins.smolconfigs").autotag()
    end,
  },

  -- format & linting
  ["jose-elias-alvarez/null-ls.nvim"] = {
    commit = "ff40739e5be6581899b43385997e39eecdbf9465",
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  -- minimal modes
  ["Pocco81/TrueZen.nvim"] = {
    cmd = {
      "TZAtaraxis",
      "TZMinimalist",
      "TZFocus",
    },
    config = function()
      require "custom.plugins.truezen"
    end,
  },

  --transparent background
  -- ["xiyaowong/nvim-transparent"] = {
  --   cmd = {
  --     "TransparentEnable"
  --   },
  --   config = function()
  --     require "custom.plugins.transparent"
  --   end,
  -- },

  -- get highlight group under cursor
  ["nvim-treesitter/playground"] = {
    cmd = "TSCaptureUnderCursor",
    config = function()
      require("nvim-treesitter.configs").setup()
    end,
  },

  -- dim inactive windows
  ["andreadev-it/shade.nvim"] = {
    module = "shade",
    config = function()
      require("custom.plugins.smolconfigs").shade()
    end,
  },

  ["Pocco81/AutoSave.nvim"] = {
    module = "autosave",
    config = function()
      require("custom.plugins.smolconfigs").autosave()
    end,
  },

  -- notes stuff
  ["nvim-neorg/neorg"] = {
    ft = "norg",
    after = "nvim-treesitter",
    config = function()
      require "custom.plugins.neorg"
    end,
  },

  ["goolord/alpha-nvim"] = {
    config = function()
      require "custom.plugins.alpha"
    end,
  },

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  ["folke/which-key.nvim"] = {
    config = function()
      require "custom.plugins.whichkey"
    end,
  },

  ["kyazdani42/nvim-tree.lua"] = {
    config = function()
      require "plugins.configs.nvimtree"
      require "custom.plugins.nvim-tree"
    end,
  },

  ["karb94/neoscroll.nvim"] = {
    config = function()
      require "custom.plugins.neoscroll"
    end,
  },

  ["mg979/vim-visual-multi"] = {},

  ["matze/vim-move"] = {
    config = function()
      require "custom.plugins.vim-move"
    end,
  },

  ["folke/trouble.nvim"] = {
    config = function()
      require "custom.plugins.trouble"
    end,
  },

  ["p00f/nvim-ts-rainbow"] = {},

  ["sindrets/diffview.nvim"] = {
    config = function()
      require "custom.plugins.diffview"
    end,
  },

  ["kevinhwang91/promise-async"] = {},


  ["yamatsum/nvim-cursorline"] = {
    config = function()
      require "custom.plugins.nvim-cursorline"
    end,
  },
}
