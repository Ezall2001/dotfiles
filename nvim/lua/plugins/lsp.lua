local config = function()
  vim.lsp.enable('lua_ls')
  vim.lsp.enable('nushell')
  vim.lsp.enable('jsonls')
end

local spec = {
  "neovim/nvim-lspconfig",
  config = config,
  dependencies = { "folke/lazydev.nvim" },
}

return spec
