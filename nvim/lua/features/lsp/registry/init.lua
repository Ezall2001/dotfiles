local DEFAULT_BUILTIN_CONF = {
	feats = {},
}

local DEFAULT_CONF = {
	colorizer = false,
	builtin = {},
	null_ls = {
		lsps = {},
		feats = {},
	},
}

local normalize_conf = function(config)
	local nconfig = vim.tbl_extend('force', DEFAULT_CONF, vim.deepcopy(config))

	for lsp, builtin_conf in pairs(nconfig.builtin) do
		local nbuiltin_conf = vim.tbl_extend('force', DEFAULT_BUILTIN_CONF, builtin_conf)
		nconfig.builtin[lsp] = nbuiltin_conf
	end

	return nconfig
end

local registry = {}

local M = {}

M.register_lsps = function(fts, configs)
	for _, ft in ipairs(fts) do
		registry[ft] = normalize_conf(configs)
	end
end

M.get_registry = function()
	return registry
end

return M
