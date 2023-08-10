local status_ok, config = pcall(require, "colorizer")
if not status_ok then
  return
end

config.setup()
