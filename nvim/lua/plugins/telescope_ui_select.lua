local config = function()
  require("telescope").load_extension("ui-select")
end

local spec = {
  'nvim-telescope/telescope-ui-select.nvim',
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = config
}

return spec
