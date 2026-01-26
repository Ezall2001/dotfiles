local registry = {
	lsp_ft_map = {},
	formatters = {},
	inlay_hint = {},
	document_color = {},
}

local register_items = function(table, key, items)
	if table[key] == nil then
		table[key] = vim.deepcopy(items)
	else
		vim.list_extend(table[key], items)
	end
end

local M = {}

M.register_lsps = function(fts, lsps, feats)
	for _, lsp in ipairs(lsps) do
		register_items(registry.lsp_ft_map, lsp, fts)
	end

	if feats.inlay_hint == true then
		vim.list_extend(registry.inlay_hint, fts)
	end

	if feats.document_color == true then
		vim.list_extend(registry.document_color, fts)
	end

	for _, ft in ipairs(fts) do
		register_items(registry.formatters, ft, feats.formatters)
	end
end

M.get_registry = function()
	return registry
end

return M
