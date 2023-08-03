local opts = { noremap = true, silent = true }
local new_cmd = vim.api.nvim_create_user_command
local api = vim.api
local keymap = api.nvim_set_keymap
local g = vim.g
local opt = vim.opt

--Remap space as leader key
keymap("", "<space>", "<Nop>", opts)
g.mapleader = " "
g.maplocalleader = " "

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move cursor each line
keymap("n", "k", "gk", { silent = true })
keymap("n", "j", "gj", { silent = true })
keymap("n", "0", "g0", { silent = true })
keymap("n", "$", "g$", { silent = true })

-- Move lines
keymap("n", "<C-j>", ":MoveLine(1)<CR>", opts)
keymap("n", "<C-k>", ":MoveLine(-1)<CR>", opts)
keymap("v", "<C-j>", ":MoveBlock(1)<CR>", opts)
keymap("v", "<C-k>", ":MoveBlock(-1)<CR>", opts)
keymap("n", "<C-l>", ":MoveHChar(1)<CR>", opts)
keymap("n", "<C-h>", ":MoveHChar(-1)<CR>", opts)
keymap("v", "<C-l>", ":MoveHBlock(1)<CR>", opts)
keymap("v", "<C-h>", ":MoveHBlock(-1)<CR>", opts)

-- Copy line up and down
keymap("n", "<A-S-j>", ":t.<CR>", opts)

vim.cmd "let g:move_key_modifier = 'A'"
vim.cmd "let g:move_key_modifier_visualmode = 'A'"

-- Vim option
vim.cmd "set whichwrap+=<,>,[,]"
vim.cmd "set wrap linebreak"
vim.cmd "set clipboard+=unnamedplus"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]]
vim.cmd "set writebackup false"
vim.cmd "set backup false"
vim.cmd "set undofile false"
opt.writebackup = false
opt.backup = false
opt.undofile = false

vim.o.foldcolumn = "1"
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

new_cmd("EnableShade", function()
  require("shade").setup()
end, {})

-- Dynamic terminal padding with/without nvim (for siduck's st only)

-- replace string from file
local function sed(from, to, fname)
  vim.cmd(string.format("silent !sed -i 's/%s/%s/g' %s", from, to, fname))
end

-- reloads xresources for current focused window only
local function liveReload_xresources()
  vim.cmd(
    string.format "silent !xrdb merge ~/.Xresources && kill -USR1 $(xprop -id $(xdotool getwindowfocus) | grep '_NET_WM_PID' | grep -oE '[[:digit:]]*$')"
  )
end

local autocmd = vim.api.nvim_create_autocmd
local opt_local = vim.opt_local

-- autocmds
-- pretty up norg ft!
autocmd("FileType", {
  pattern = "norg",
  callback = function()
    opt_local.number = false
    opt_local.cole = 1
    opt_local.foldlevel = 10
    opt_local.foldenable = false
    opt_local.signcolumn = "yes:2"
  end,
})

autocmd({ "BufNewFile", "BufRead" }, {
  callback = function(ctx)
    -- remove terminal padding
    -- exclude when nvim has norg ft & more than 2 buffers

    if vim.bo.ft == "norg" or #vim.fn.getbufinfo { buflisted = 1 } > 1 then
      sed("st.borderpx: 20", "st.borderpx: 0", "~/.Xresources")
      liveReload_xresources()

      -- revert xresources change but dont reload it
      sed("st.borderpx: 0", "st.borderpx: 20", "~/.Xresources")

      vim.cmd(string.format "silent !xrdb merge ~/.Xresources")
      vim.api.nvim_del_autocmd(ctx.id)
    end
  end,
})

-- add terminal padding
autocmd("VimLeavePre", {
  callback = function()
    sed("st.borderpx: 0", "st.borderpx: 20", "~/.Xresources")
    liveReload_xresources()
  end,
})

require "custom.commands"
