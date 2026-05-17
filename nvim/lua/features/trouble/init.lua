local M = {}

M.views = {}
M.views.calls = require('features.trouble.views.calls')
M.views.definitions = require('features.trouble.views.definitions')
M.views.diagnostics = require('features.trouble.views.diagnostics')
M.views.implementations = require('features.trouble.views.implementations')
M.views.references = require('features.trouble.views.references')
M.views.symbols = require('features.trouble.views.symbols')

M.actions = {}
M.actions.navigate = require('features.trouble.actions.navigate')

return M
