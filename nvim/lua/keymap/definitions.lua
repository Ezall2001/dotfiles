local telescope = function (builtin) 
  vim.keymap.set('n', '<Leader>ff', builtin.find_files, { desc = "telescope find files" })
  vim.keymap.set('n', '<Leader>fh', builtin.help_tags, { desc = "telescope find help tags" })
  vim.keymap.set('n', '<Leader>fg', builtin.live_grep, { desc = "telescope live grep" })
end

local general = function () 
  vim.keymap.set('n', '<Leader>ex', vim.cmd.Ex)
  vim.keymap.set('n', '<C-d>', '<C-d>zz')
  vim.keymap.set('n', '<C-u>', '<C-u>zz')
end 

local custom_commands = function ()
  vim.keymap.set('n', '<Leader>tr', require("commands.toggle_bg_transparency"))
end 

return {
  general = general,
  custom_commands = custom_commands,
  telescope = telescope
}
