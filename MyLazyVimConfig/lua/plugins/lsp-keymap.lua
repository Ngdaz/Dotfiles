return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local Util = require("lazyvim.util")
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- change a keymap
      keys[#keys + 1] = { "<leader>ll", "<cmd>LspInfo<cr>", desc = "Lsp Info" }
      keys[#keys + 1] = {
        "<leader>lf",
        function()
          Util.format({ force = true })
        end,
        desc = "Format code",
      }

      keys[#keys + 1] = {
        "<leader>la",
        vim.lsp.buf.code_action,
        desc = "Code Action",
        mode = { "n", "v" },
        has = "codeAction",
      }

      keys[#keys + 1] = {
        "<leader>lA",
        function()
          vim.lsp.buf.code_action({
            context = {
              only = {
                "source",
              },
              diagnostics = {},
            },
          })
        end,
        desc = "Source Action",
        has = "codeAction",
      }

      keys[#keys + 1] = {
        "<leader>lo",
        function()
          vim.lsp.buf.code_action({
            apply = true,
            context = {
              only = { "source.organizeImports.ts" },
              diagnostics = {},
            },
          })
        end,
        desc = "Organize Imports",
      }

      keys[#keys + 1] = {
        "<leader>lL",
        function()
          vim.lsp.buf.code_action({
            apply = true,
            context = {
              only = { "source.removeUnused.ts" },
              diagnostics = {},
            },
          })
        end,
        desc = "Remove Unused Imports",
      }
      -- Disable some keymaps
      keys[#keys + 1] = { "<leader>ca", false }
      keys[#keys + 1] = { "<leader>cA", false }
      keys[#keys + 1] = { "<leader>cD", false }
      keys[#keys + 1] = { "<leader>cr", false }
      keys[#keys + 1] = { "<leader>cl", false }
    end,
  },
  {
    "williamboman/mason.nvim",
    keys = {
      {
        "<leader>cm",
        false,
      },
      { "<leader>lm", "<cmd>Mason<cr>", desc = "Mason" },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- disable the keymap to grep files
      { "<leader>/", false },
    },
  },
  {
    "stevearc/conform.nvim",
    keys = {
      {
        "<leader>cF",
        false,
      },
      {
        "<leader>lF",
        function()
          require("conform").format({ formatters = { "injected" } })
        end,
        mode = { "n", "v" },
        desc = "Format Injected Langs",
      },
    },
  },
}
