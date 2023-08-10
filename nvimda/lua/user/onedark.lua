local status_ok, config = pcall(require, "onedark")
if not status_ok then
  return
end

config.setup({
  style = 'deep'
})
