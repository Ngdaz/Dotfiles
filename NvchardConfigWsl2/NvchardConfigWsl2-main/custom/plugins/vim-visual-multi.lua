local status_ok, vimVisualMultiple = pcall(require, "vim-visual-multiple")
if not status_ok then
  return
end

vimVisualMultiple.setup {}
