local status_ok, autotag = pcall(require, "nvim-ts-autotag")
if not status_ok then
  return
end

autotag.setup({
  filetypes = {
    'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript',
    'xml',
    'php',
    'markdown',
    'glimmer', 'handlebars', 'hbs'
  }
})
