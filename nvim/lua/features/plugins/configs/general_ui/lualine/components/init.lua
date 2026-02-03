local M = {}

M.filetype = { 'filetype' }
M.mode = { 'mode' }
M.branch = { 'branch' }
M.location = { 'location' }
M.progress = { 'progress' }
M.diff = require('features.plugins.configs.general_ui.lualine.components.diff')
M.diagnostics = require('features.plugins.configs.general_ui.lualine.components.diagnostics')
M.tabs = require('features.plugins.configs.general_ui.lualine.components.tabs')
M.filename = require('features.plugins.configs.general_ui.lualine.components.filename')

return M
