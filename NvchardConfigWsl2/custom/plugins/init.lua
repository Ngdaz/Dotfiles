local overrides = require "custom.plugins.overrides"

return {

  ----------------------------------------- default plugins ------------------------------------------

  ["folke/which-key.nvim"] = {
    rm_default_opts = true,
    config = function()
      require "custom.plugins.whichkey"
    end,
  },

  ["goolord/alpha-nvim"] = {
    rm_default_opts = true,
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

  -- override default configs
  ["kyazdani42/nvim-tree.lua"] = {
    rm_default_opts = true,
    after = "ui",
    config = function()
      require "custom.plugins.nvim-tree"
    end,
  },

  ["nvim-treesitter/nvim-treesitter"] = { override_options = overrides.treesitter },
  ["lukas-reineke/indent-blankline.nvim"] = { override_options = overrides.blankline },
  ["williamboman/mason.nvim"] = { override_options = overrides.mason },

  -- ["NvChad/ui"] = {
  --   override_options = {
  --     statusline = {
  --       -- separater_style = 'round'
  --       separator_style = "round", -- default/round/block/arrow
  --
  --       -- separator_style = "arrow",
  --     },
  --   },
  -- },

  --------------------------------------------- custom plugins ----------------------------------------------

  -- autoclose tags in html, jsx only
  ["windwp/nvim-ts-autotag"] = {
    ft = { "html", "javascriptreact" },
    after = "nvim-treesitter",
    config = function()
      local present, autotag = pcall(require, "nvim-ts-autotag")

      if present then
        autotag.setup()
      end
    end,
  },

  -- format & linting
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  -- distraction free modes
  ["Pocco81/TrueZen.nvim"] = {
    disable = true,
    cmd = {
      "TZAtaraxis",
      "TZMinimalist",
      "TZFocus",
    },
    config = function()
      require "custom.plugins.truezen"
    end,
  },

  -- get highlight group under cursor
  ["nvim-treesitter/playground"] = {
    module = "nvim-treesitter",
    setup = function()
      require("core.lazy_load").on_file_open "nvim-treesitter"
    end,
    cmd = require("core.lazy_load").treesitter_cmds,
    run = ":TSUpdate",
    config = function()
      require "plugins.configs.treesitter"
    end,
  },

  -- I rarely use shade.nvim/autosave.nvim so made commands to enable them

  -- dim inactive windows
  ["andreadev-it/shade.nvim"] = {
    opt = true,
    config = function()
      require "custom.plugins.shade"
    end,
  },

  -- autosave
  ["Pocco81/auto-save.nvim"] = {
    opt = true,
    config = function()
      require("auto-save").setup()
    end,
  },

  ["folke/zen-mode.nvim"] = {
    cmd = "ZenMode",
    config = function()
      require("zen-mode").setup {
        window = {
          width = vim.g.zenmode, -- width will be 85% of the editor width
        },
      }
    end,
  },

  ["matze/vim-move"] = {
    config = function()
      require "custom.plugins.vim-move"
    end,
  },

  ["yamatsum/nvim-cursorline"] = {
    config = function()
      require "custom.plugins.nvim-cursorline"
    end,
  },

  -- basic diagrams for flow charts etc
  ["jbyuki/venn.nvim"] = {
    module = "venn.nvim",
    config = function()
      require("custom.plugins.venn").setup()
    end,
  },

  ["karb94/neoscroll.nvim"] = {
    config = function()
      require "custom.plugins.neoscroll"
    end,
  },

  -- notes stuff
  ["nvim-neorg/neorg"] = {
    tag = "0.0.12",
    ft = "norg",
    after = "nvim-treesitter",
    setup = function()
      require("custom.plugins.neorg").autocmd()
    end,
    config = function()
      require("custom.plugins.neorg").setup()
    end,
  },

  ["folke/trouble.nvim"] = {
    config = function()
      require "custom.plugins.trouble"
    end,
  },
  -- edit multiple word
  --
  ["mg979/vim-visual-multi"] = {
    config = function()
      require "custom.plugins.vim-visual-multi"
    end,
  },

  --
  ["p00f/nvim-ts-rainbow"] = {},

  -- quick overview in a file
  ["simrat39/symbols-outline.nvim"] = {
    config = function()
      require "custom.plugins.symbols-outline"
    end,
  },
}
