local config = function()
  local ts_config = require("nvim-treesitter.configs")

  ts_config.setup({
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true }
  })
end


local spec = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = config
}

return spec
