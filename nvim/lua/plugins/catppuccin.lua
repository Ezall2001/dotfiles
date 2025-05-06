local theme_opts = {
  flavour = "auto",
  transparent_background = true,
  term_colors = true
}

local config = function()
  require("catppuccin").setup(theme_opts)
  vim.cmd.colorscheme "catppuccin"
end

local spec = {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = config
}

return spec
