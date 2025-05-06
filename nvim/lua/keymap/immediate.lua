vim.g.mapleader = " "

local keymap = {
  { "n", "<leader>ex", vim.cmd.Ex },
  { "n", "<leader>tr", require("keymap.commands.toggle_bg_transparency") }
}

return keymap
