local r = require('features.lsp.registry').get_registry()

local codelens = function(enable, buf, client_id)
	vim.lsp.codelens.enable(enable, { bufnr = buf, client_id = client_id })
end

local document_color = function(enable, _, client_id)
	vim.lsp.document_color.enable(enable, { client_id = client_id }, { style = 'virtual' })
end

local inlay_hint = function(enable, buf, client_id)
	vim.lsp.inlay_hint.enable(enable, { bufnr = buf, client_id = client_id })
end

local inline_completion = function(enable, buf, client_id)
	vim.lsp.inline_completion.enable(enable, { bufnr = buf, client_id = client_id })
end

local linked_editing_range = function(enable, buf, client_id)
	vim.lsp.linked_editing_range.enable(enable, { bufnr = buf, client_id = client_id })
end

local on_type_formatting = function(enable, buf, client_id)
	vim.lsp.on_type_formatting.enable(enable, { bufnr = buf, client_id = client_id })
end

local semantic_tokens = function(enable, _, client_id)
	vim.lsp.semantic_tokens.enable(enable, { client_id = client_id })
end

local FEAT_MAP = {
	codelens = { fn = codelens },
	document_color = { fn = document_color },
	inlay_hint = { fn = inlay_hint },
	on_type_formatting = { fn = on_type_formatting },
	semantic_tokens = { fn = semantic_tokens },
	linked_editing_range = { fn = linked_editing_range },
	inline_completion = { fn = inline_completion },
}

local M = {}

M.apply = function(buf, client_id)
	local client = vim.lsp.get_client_by_id(client_id)
	if client == nil then
		return
	end

	local ft = vim.bo[buf].filetype
	local conf = r[ft]

	local feats = {}

	if client.name == 'null-ls' then
		feats = conf.null_ls.feats
	elseif conf.builtin[client.name] ~= nil then
		feats = conf.builtin[client.name].feats
	end

	for _, feat in ipairs(feats) do
		if FEAT_MAP[feat] ~= nil then
			FEAT_MAP[feat].fn(true, buf, client_id)
		end
	end
end

M.init = function()
	for _, feat in pairs(FEAT_MAP) do
		feat.fn(false, nil, nil)
	end
end

return M
