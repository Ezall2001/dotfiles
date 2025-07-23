local config = function()
  local telescope = require('telescope')
  local builtin = require('telescope.builtin')
  local keymaps = require('keymap.definitions')
  keymaps.telescope(builtin)

  telescope.setup {
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown {}
      }
    }
  }
end

local spec = {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  config = config,
  dependencies = { 'nvim-lua/plenary.nvim' }

}

return spec
