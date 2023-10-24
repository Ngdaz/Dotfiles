return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
      defaults = {
        mode = { "n", "v" },
        ["<leader>l"] = { name = "+Format code action" },
      },
    },
    keys = {
      { "<leader>c", false },
    },
  },
}
