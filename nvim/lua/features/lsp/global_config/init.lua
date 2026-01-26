local M = {}

M.init = function()
	require('features.lsp.global_config.completion').init()
	require('features.lsp.global_config.diagnostics').init()
	require('features.lsp.global_config.fix').init()
	require('features.lsp.global_config.features').init()
end

M.diagnostics_config = require('features.lsp.global_config.diagnostics').config
return M
