local calls = require('features.trouble.views.calls')
local definitions = require('features.trouble.views.definitions')
local diagnostics = require('features.trouble.views.diagnostics')
local implementations = require('features.trouble.views.implementations')
local references = require('features.trouble.views.references')
local symbols = require('features.trouble.views.symbols')

local M = {}

M.views = {}
M.views.calls = calls
M.views.definitions = definitions
M.views.diagnostics = diagnostics
M.views.implementations = implementations
M.views.references = references
M.views.symbols = symbols

return M
