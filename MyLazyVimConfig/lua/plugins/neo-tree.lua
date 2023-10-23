return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    optional = true,
    opts = function(_, opts)
      opts.filesystem = {
        window = {
          mappings = {
            ["l"] = "open",
          },
        },
      }
    end,
  },
}
