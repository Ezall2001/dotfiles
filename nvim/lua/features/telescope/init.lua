local calls = require('features.telescope.pickers.calls')
local definitions = require('features.telescope.pickers.definitions')
local dev = require('features.telescope.pickers.dev')
local diagnostics = require('features.telescope.pickers.diagnostics')
local git = require('features.telescope.pickers.git')
local implementations = require('features.telescope.pickers.implementations')
local other = require('features.telescope.pickers.other')
local previewer = require('features.telescope.previewers')
local references = require('features.telescope.pickers.references')
local symbols = require('features.telescope.pickers.symbols')

local M = {}

M.pickers = {}

M.pickers.calls = calls
M.pickers.definitions = definitions
M.pickers.dev = dev
M.pickers.diagnostics = diagnostics
M.pickers.git = git
M.pickers.implementations = implementations
M.pickers.other = other
M.pickers.references = references
M.pickers.symbols = symbols

M.previewer = previewer

return M
