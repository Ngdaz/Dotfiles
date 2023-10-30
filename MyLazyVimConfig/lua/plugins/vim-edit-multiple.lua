return {
  "mg979/vim-visual-multi",
  branch = "master",
  setup = function()
    vim.g.Vm_default_mappings = 0
    vim.g.VM_maps = {
      ["Find Under"] = "",
    }
  end,
}
