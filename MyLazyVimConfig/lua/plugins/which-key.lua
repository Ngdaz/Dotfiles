return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
      spec = {
        { "<leader>c", group = "Delete Buffer", mode = { "n", "v" } },
        { "<leader>l", group = "Format code action", mode = { "n", "v" } },
      },
    },
  },
}
