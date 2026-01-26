local M = {}

M.r_plugin_config_root_dir = 'features/plugins/configs'
M.nvim_root_dir = vim.fn.expand('~/.config/nvim')
M.project_dir = '.nvim'
M.state_dir = vim.fn.stdpath('state')
M.shared_shada = vim.fs.joinpath(M.state_dir, 'shada/main.shada')

return M
