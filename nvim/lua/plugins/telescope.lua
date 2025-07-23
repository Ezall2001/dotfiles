local config = function () 
  local builtin = require('telescope.builtin')
  local keymaps = require('keymap.definitions')
  keymaps.telescope(builtin)
end 

local spec = {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  config = config,
  dependencies = { 'nvim-lua/plenary.nvim' }

}

return spec

